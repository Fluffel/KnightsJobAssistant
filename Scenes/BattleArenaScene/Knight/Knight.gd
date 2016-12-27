
extends Sprite

export var strength = 20
export var defense = 0.0
export var agility = 0.0
export var lifeReg = 0.0
export var crit = 0.0
export var hp = 100
export var attackSpeed = 0.5
# diese Werte werden letztendlich zum abrechnen verwendet


var hunger

var state = 0
var currentMonster

var selectedPotions = []
var buffs = []

#var specialattackScenes = []
#var spPath = "res://Scenes/BattleArenaScene/Knight/SpeccialAttacks"

#var loadedSpecialattacksDictionnary = load("res://HelperScripts/SpecialattacksDictionnary.gd")
onready var specialattacksDictionnary = get_node("/root/SpecialattacksDictionnary")

onready var buffBar = get_node("BuffBar")

onready var anim = get_node("anim")
onready var attackSpeedHandler = get_node("attackSpeedHandler")
onready var healthBar = get_node("healthBar")

func _ready():
	
	attackSpeedHandler.connect("timeout", self, "afterAttackWait")
	anim.connect("finished",self,"after_attack")
	
#	createSpecialattackArray()
	
	anim.set_default_blend_time(0.3)
	healthBar.set_value(hp)
	
	
	setAttackSpeed(1 / attackSpeed)
	
	if currentMonster != null:
		attack()
		currentMonster.startFighting()
	else:
		state = 0
		anim.play("idle")
		#print("no mosnter")

func ready_monster_loaded():
	
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
	anim.play("idle")
	if state == 1:
		attackSpeedHandler.start()

func afterAttackWait():
	
	if state == 1:
		attack()
		
func attack():
	anim.play("attack")

func setAttackSpeed(attackLength):
	var animLength = anim.get_animation("attack").get_length()
	if attackLength >= animLength:
		attackSpeedHandler.set_wait_time(attackLength - animLength)
	else:
		attackSpeedHandler.set_wait_time(0.01)


func dealDamage():
	#print("Damage dealt")
	var specialattack = specialattacksDictionnary.initializeSpecialattack(selectedPotions, buffs)
	
	if specialattack != null:
		activateSpecialattack(specialattack)
	else:
		if currentMonster != null:
			currentMonster.monsterTakesDmg(strength(), true)
		
	print("selected potions: ", selectedPotions)
	
	buffKnight()
	
func activateSpecialattack(specialattack):
	if specialattack.addToKnight == true:
		add_child(specialattack)
	elif specialattack.addToKnight == false:
		currentMonster.add_child(specialattack)
		
	specialattack.makeYourImpact()

func knightTakesDmg(value):
	hp -= value * (1 - defense)
	healthBar.set_value(hp)
	
	print("LebenKnight: ", hp)
	

func buffKnight():
	for s in selectedPotions:
		buffs.append(s.getBuff())
		
		if buffs.size() > 10:
			buffs.remove(0)
	buffBar.arrangeBuffs()
	selectedPotions.clear()
	
func buffStats():
	var dic = {"strength": 0,
				"defense": 0,
				"agility": 0,
				"lifeReg": 0,
				"crit": 0}
	for b in buffs:
		dic["strength"] += b.strength
		dic["defense"] += b.defense
		dic["agility"] += b.agility
		dic["lifeReg"] += b.lifeReg
		dic["crit"] += b.crit
		
	return dic
	
	
	
	
func strength():
	return buffStats()["strength"] + strength
	
func defense():
	return buffStats()["defense"] + defense
	
func agility():
	return buffStats()["agility"] + agility
	
func lifeReg():
	return buffStats()["lifeReg"] + lifeReg
	
func crit():
	return buffStats()["crit"] + crit
	
	

func _on_lifeReg_timeout():
	hp += lifeReg()
	if hp > healthBar.get_max():
		hp = healthBar.get_max()
	healthBar.set_value(hp)
