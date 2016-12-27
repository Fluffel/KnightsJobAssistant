
extends Control

onready var knight = get_node("kampf/Knight")
var packedMonsterArray = []

onready var timer = get_node("Timer")

func _ready():
	for m in range(2):	
		#needs to count monsters... maybe a global func for counting is needed (potions, monsters..)
		print("monsterLoaded", load("res://Scenes/BattleArenaScene/Monsters/monster" + str(0) + ".tscn"))
		packedMonsterArray.append(load("res://Scenes/BattleArenaScene/Monsters/monster" + str(m) + ".tscn"))
	
	timer.connect("timeout",self,"loadMonster")
	timer.start()

func startLoadingMonster():
	timer.start()
func loadMonster():
	randomize()
	var randNum = randi() % 2
	var monster = packedMonsterArray[randNum].instance()
	get_node("kampf").add_child(monster)
