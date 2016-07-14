
extends Node2D

export var hp = 0.0
export var damage = 0.0
export var defense = 0.0
export var resistenceRed = 0.0
export var resistenceBlue = 0.0
export var resistenceYellow = 0.0
export var resistenceWhite = 0.0
export var speed = 0.0 #attack speed
export var intelligence = 0.0 #hit chance, crit chance, dodge?,  
var timer = Timer.new()


onready var animP = get_node("animP")
#export (Animation) var anim_attack
#export (Animation) var anim_idle
onready var player

#only debug:
func _process(delta):
	#print("timer time: ", timer.get_time_left())
	pass
func _ready():
	set_spawnPos()
#	print("read")
#	for i in get_parent().get_children():
#		print(i.get_name())
	player = get_parent().get_node("Knight")
#	print("knight: ",player)
	player.currentMonster = self
	player.state = 1
	add_child(timer)
	timer.set_wait_time(speed)
	timer.connect("timeout",self,"attack")
	set_process(true)
	player.ready_monster_loaded()
#	animP.add_animation("attack",anim_attack)
#	animP.add_animation("idle",anim_idle)

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
	var atk_speed = 1
	var anim_attack = animP.get_animation("attack")
	if (anim_attack.get_length() > timer.get_wait_time()):
		atk_speed = anim_attack.get_length() / timer.get_wait_time()
	#print("atk_speed",atk_speed)
	animP.play("attack")
	timer.start()
	
func monsterTakesDmg(value):
	var r = randf()
	hp -= value
	if r <= 0.5:
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
	get_parent().get_parent().add_child(item)





