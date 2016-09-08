
extends Control

onready var knight = get_node("root/mainControl/battleArena/kampf/Knight")
var type = 0# 0 = blue 1 = red 2 = zellow 3 = green 4 = white 5 = black
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
	
#	texttur musss herausgesucht werden
	
#func buffAttack():
#	knight.currentBuffs().append(buff(type, strength))

