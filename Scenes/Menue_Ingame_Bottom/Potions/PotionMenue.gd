
extends Control

var potions = []
#var button = Button()

func _ready():
	for i in range(10):
		appendPotions(2, 1, Globals.get("RED"))
		appendPotions(2, 1,Globals.get("RED"))
		appendPotions(2, 1, Globals.get("BLUE"))
		appendPotions(2, 1, Globals.get("BLUE"))
		appendPotions(2, 1, Globals.get("GREEN"))
		appendPotions(2, 1, Globals.get("GREEN"))
		appendPotions(2, 1, Globals.get("BLACK"))
		appendPotions(2, 1, Globals.get("BLACK"))
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