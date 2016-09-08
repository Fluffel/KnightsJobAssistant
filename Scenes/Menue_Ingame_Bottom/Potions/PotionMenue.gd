
extends Control

var potions = []
#var button = Button()

func _ready():
	appendPotions(2, 1, 0)
	appendPotions(2, 1, 0)
	appendPotions(2, 1, 3)
	appendPotions(2, 1, 1)
	appendPotions(2, 1, 2)
	appendPotions(2, 1, 3)
	appendPotions(2, 1, 2)
	appendPotions(2, 1, 3)
	fillPotionsInButtons()
	
func appendPotions(multiply, lvl, type):
	var packedScene = load("res://Scenes/BattleArenaScene/Potions/Potion.scn")
	var potion = packedScene.instance()
	potion.setUp(multiply, lvl, type)
	potions.append(potion)
	
func fillPotionsInButtons():
	for b in get_children():
		b.potions = []
	for p in potions:
		get_child(p.type).potions.append(p)
	for b in get_children():
		b.updateLabels()