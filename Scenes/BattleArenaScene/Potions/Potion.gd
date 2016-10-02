
extends Control

onready var knight = get_node("root/mainControl/battleArena/kampf/Knight")
var type = 0     # WICHTIG!!!!! 0 = blue 1 = red 2 = green 3 = black ,siehe PO_singleton
var level = 1
var multiply = 1.1
#red
const burn = 8
#blue
const slow = 2
#green
const heal = 3
#black
const poison = 4
const dmg = 20 #vielleicht schlect fuers balancen

const crit = 1.5



func _ready():
	pass

func setUp(multiply, lvl, type):
	self.multiply = multiply
	level = lvl
	self.type = type
	
func getBuff():
	var packedSceneBuff = load("res://Scenes/BattleArenaScene/Potions/Buff.tscn")
	var buff = packedSceneBuff.instance()
	
	setUpBuff(buff, type, level, multiply)
	
	return buff
	
func getTypeColor(type):
	if type == Globals.get("BLUE"):
		return Color(0.1, 0.1, 0.95)
	
	if type == Globals.get("RED"):
		return Color(0.95, 0.1, 0.1)
		
	if type == Globals.get("GREEN"):
		return Color(0.1, 0.95, 0.1)
		
	if type == Globals.get("BLACK"):
		return Color(0.1, 0.1, 0.1)
	
func setUpBuff(buff, type, level, multiply):
	buff.type = type
	buff.level = level
	buff.multiply = multiply
	
	buff.get_node("Sprite").set_modulate(getTypeColor(type))
#	texttur musss herausgesucht werden
	
#func buffAttack():
#	knight.currentBuffs().append(buff(type, strength))

