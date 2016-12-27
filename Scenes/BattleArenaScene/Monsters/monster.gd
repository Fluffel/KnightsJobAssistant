
extends Node2D

export var hp = 0.0
export var damage = 0.0
export var defense = 0.0
export var resistenceRed = 0.0
export var resistenceBlue = 0.0
export var resistenceYellow = 0.0
export var resistenceWhite = 0.0
export var attackSpeed = 0.0
export var intelligence = 0.0 #hit chance, crit chance, dodge?,  

var speed = 1.0

var timer = Timer.new()


onready var animP = get_node("animP")
#export (Animation) var anim_attack
#export (Animation) var anim_idle
var player

func _ready():
	set_spawnPos()
	
	player = get_parent().get_node("Knight")
	
	player.currentMonster = self
	player.state = 1
	
	add_child(timer)
	timer.set_wait_time(attackSpeed)
	timer.connect("timeout",self,"attack")
	
#	set_process(true)
	player.ready_monster_loaded()

func get_strengthFactor(multiply):
	return ((resistenceRed + resistenceBlue + resistenceWhite + resistenceYellow)/4 + damage * hp * speed) #braucht noch improvement
	
func set_spawnPos():
	set_pos(Vector2(300,200)) 
	#print("monserterPos: ",get_pos())
	
func die():
	player.state = 0
	player.currentMonster = null
	get_parent().get_parent().startLoadingMonster()
	
	queue_free()
		#TODO anim, loot, ...
	
func attack():
#	var atk_speed = 1
#	var anim_attack = animP.get_animation("attack")
#	if anim_attack.get_length() > timer.get_wait_time():
#		atk_speed = anim_attack.get_length() / timer.get_wait_time()
	#print("atk_speed",atk_speed)
	animP.play("attack")
	timer.start()
	
func monsterTakesDmg(value, itemdrop):
	var r = randf()
	hp -= value
	if itemdrop == true:
		if r <= 1:
			dropItem(r)
	if hp <= 0:
		die()
		
	print("LebenMonster: ", hp)
	
func dealDamage():
	player.knightTakesDmg(damage)
	
func startFighting():
	timer.start()
	#print("timer started")
	
func dropItem(valueDroppedItem):
	var packedScene = load("res://Scenes/BattleArenaScene/Monsters/monsteritems.tscn")
	var item = packedScene.instance()
	get_parent().get_parent().get_node("items").add_child(item)

func freezing(value, color):
	getTexture().set_modulate(color)
	
	if speed + value >= 0:
		speed += value
	else:
		speed = 0
	setAnimationspeed(speed)


