
extends Control

onready var knight = get_node("kampf/Knight")
var packedMonsterArray = [load("res://Scenes/BattleArenaScene/Monsters/monster" + str(1) + ".tscn"), load("res://Scenes/BattleArenaScene/Monsters/monster" + str(2) + ".tscn")]

onready var timer = get_node("Timer")
func _ready():
	timer.connect("timeout",self,"loadMonster")
	timer.start()

func startLoadingMonster():
	timer.start()
func loadMonster():
	randomize()
	var randNum = randi() % 2
	var monster = packedMonsterArray[randNum].instance()
	get_node("kampf").add_child(monster)
