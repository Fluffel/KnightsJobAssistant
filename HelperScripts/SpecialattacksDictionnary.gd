extends Node

var specialattackScenes = []
var spPath = "res://Scenes/BattleArenaScene/Knight/SpeccialAttacks"
var spDict = {}




func _ready():
	Globals.set("BLUE",0)
	Globals.set("RED",1)
	Globals.set("GREEN",2)
	Globals.set("BLACK",3)
	
	
	
	for i in range(countFiles()):
		var packedScene = load(spPath + "/Specialattack" + str(i) + ".tscn")
		var sp = packedScene.instance()
		sp.setUp()
		print(sp.potioncombination)
		spDict[sp.potioncombination] = packedScene
		print("spdict", spDict)
	

func initializeSpecialattack(potions, buffs):
	var potionkey = [0, 0, 0, 0]
	for p in potions:
		potionkey[p.type] += 1
	
	
	print("spdict", spDict)
	if spDict.has(potionkey):
		var specialattack = spDict[potionkey].instance()
		if specialattack.initialization(potions, buffs) == true:
			return(specialattack)

func countFiles():
	var i = 0
	var file = File.new()
	while file.file_exists(spPath + "/Specialattack" + str(i) + ".tscn"):
		i += 1
	return(i)