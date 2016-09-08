
extends Sprite

export var strength = 20
export var agility = 0.0
export var hp = 100
export var defense = 0.0
export var crit = 0.0
export var lifeReg = 0.0
var hunger

var state = 0
var currentMonster
var selectedPotions = []
var buffs = []

onready var anim = get_node("anim")


func _ready():
	anim.set_default_blend_time(0.3)
	anim.connect("finished",self,"after_attack")
	if currentMonster != null:
		attack()
		currentMonster.startFighting()
	else:
		state = 0
		anim.play("idle")
		#print("no mosnter")

func ready_monster_loaded():
	
	print("cu  monster; ", currentMonster)
	if currentMonster != null:
		attack()
		currentMonster.startFighting()
	else:
		state = 0
		anim.play("idle")
		#print("no mosnter")
	
func after_attack():
	#ausdauerverringerm
	#hunger wird weniger
	#waffe nimmt schaden
	#wenn attacke gemacht wurde prozentual deren schaden verringern...
	if state == 1:
		attack()
	elif state == 0:
		#print("animas: ",anim.get_animation_list())
		anim.play("idle")
		
func attack():
	anim.play("attack")


func dealDamage():
	#print("Damage dealt")
	currentMonster.monsterTakesDmg(strength)
	


func knightTakesDmg(value):
	hp -= value
	print("LebenKnight: ", hp)
