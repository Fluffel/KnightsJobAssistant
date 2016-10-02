extends Node

var loader = load("res://HelperScripts/loader.gd")
var SAVEPATH = "user://savegame.bin"
var money = 0

func _ready():
	#print("test")
#	print(saveGameToFile(SAVEPATH,[knight.toSaveDict(),Game.tosacedict(),manue,tosavedict()]))
	print(saveGameToFile(SAVEPATH,[ {"hello":"world","eins":1} ]))
	print(loadGameFromFile(SAVEPATH))
	
func loadGameFromFile(file):
	var dictionarys = []
	var currentLine = {}
	var loadFile = File.new()
	if !loadFile.file_exists(file):
		return
	print("openingn file at", file, "with password: " + OS.get_unique_ID())
	loadFile.open_encrypted_with_pass(file, File.READ, OS.get_unique_ID())
	while (!loadFile.eof_reached()):
		currentLine.parse_json(loadFile.get_line())
		dictionarys.append(currentLine)
	loadFile.close()
	return dictionarys
	
func saveGameToFile(file,dictArray):
	var saveFile = File.new()
	print("saving file at", file, "with password: " + OS.get_unique_ID())
	saveFile.open_encrypted_with_pass(file, File.WRITE, OS.get_unique_ID())
	for d in dictArray:
		saveFile.store_line(d.to_json())
	saveFile.close()