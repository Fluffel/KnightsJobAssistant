
extends "res://Scenes/BattleArenaScene/Knight/SpeccialAttacks/specialattackToExtendFrom.gd"

# member variables here, example:
# var a=2
# var b="textvar"

func setUp():
	addToKnight = false
	
	buffcombination[Globals.get("RED")] = 1
	potioncombination[Globals.get("RED")] = 1

func lookForBuffamount(potions, buffs):
		
	if typesOfBuffs[Globals.get("RED")] >= buffcombination[Globals.get("RED")]:
		removePotionsAndBuffs(potions, buffs)
		return(true)
		
func makeYourImpact():
	timer.set_wait_time(10)
	timer.start()
	set_process(true)
#	dealFireDmg()
	
func _process(delta):
	get_parent().monsterTakesDmg(1000 * delta, false)
