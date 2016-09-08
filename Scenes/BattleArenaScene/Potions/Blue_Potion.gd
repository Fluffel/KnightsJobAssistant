
extends "res://Scenes/BattleArenaScene/Potions/Potions.gd"



# slows enemies, strength: 1. instan effect: immediatly slows down enemies (for the next hit) 2. buff effect: increases def 3. buff effect: 

func _ready():
	type = 0
	strength = [1, 1]


func instEffect():
	knight.currentMonster.speed = knight.currentMonster.speed - 1

func buffEffect():
	knight.defense = knight.defense + 1 * strength[1]

func whichTexture():
	return("res://Texturen/Potions/bluePotion.png")
