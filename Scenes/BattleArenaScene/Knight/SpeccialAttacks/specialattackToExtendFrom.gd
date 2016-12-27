
extends Control

var potioncombination = [0, 0, 0, 0]
var buffcombination = [0, 0, 0, 0]
var typesOfBuffs = [0, 0, 0, 0]

var addToKnight

var timer = Timer.new()



func initialization(potions, buffs):
	setUp()
	
	add_child(timer)
	timer.connect("timeout", self, "remove")
	
	for b in buffs:
		typesOfBuffs[b.type] += 1
		
	if lookForBuffamount(potions, buffs) == true:
		return(true)

func remove():
	print("removed specailattack")
	if has_method("specificRemove") == true:
		specificRemove()
	get_parent().remove_child(self)

func removePotionsAndBuffs(potions, buffs):
		potions.clear()
		
		var red = buffcombination[Globals.get("RED")]
		var blue = buffcombination[Globals.get("BLUE")]
		var green = buffcombination[Globals.get("GREEN")]
		var black = buffcombination[Globals.get("BLACK")]
		
		for b in buffs:
			if b.type == Globals.get("RED") and red > 0:
				buffs.erase(b)
				red -= 1
			if b.type == Globals.get("BLUE") and blue > 0:
				buffs.erase(b)
				blue -= 1
			if b.type == Globals.get("GREEN") and green > 0:
				buffs.erase(b)
				green -= 1
			if b.type == Globals.get("BLACK") and black > 0:
				buffs.erase(b)
				black -= 1
	