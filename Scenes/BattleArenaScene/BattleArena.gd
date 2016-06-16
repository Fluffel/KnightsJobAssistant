
extends Control

onready var knight = get_node("kampf/Knight")

onready var timer = get_node("Timer")
func _ready():
	timer.connect("timeout",self,"loadMonster")
	timer.start()

func startLoadingMonster():
	timer.start()
func loadMonster():
	randomize()
	var randNum = randi() % 2 + 1
	var packedscn = load("res://Scenes/BattleArenaScene/Monsters/monster" + str(randNum) + ".tscn")
	var monster = packedscn.instance()
	get_node("kampf").add_child(monster)
