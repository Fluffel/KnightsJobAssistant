
extends "res://Scenes/BattleArenaScene/Knight/SpeccialAttacks/specialattackToExtendFrom.gd"

var slow = -0.5

func setUp():
	addToKnight = false
	
	buffcombination[Globals.get("BLUE")] = 1
	potioncombination[Globals.get("BLUE")] = 1

func lookForBuffamount(potions, buffs):
		
	if typesOfBuffs[Globals.get("BLUE")] >= buffcombination[Globals.get("BLUE")]:
		removePotionsAndBuffs(potions, buffs)
		return(true)
		
func makeYourImpact():
	timer.set_wait_time(3)
	timer.start()
	get_parent().freezing(slow, Color(0.55, 0.55, 1))




func specificRemove():
	print("nowspecific")
	get_parent().freezing(-slow, Color(1, 1, 1))