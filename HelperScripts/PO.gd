extends Node

func _ready():
	Globals.set("BLUE",0)
	Globals.set("RED",1)
	Globals.set("GREEN",2)
	Globals.set("BLACK",3)
	print(Globals.get("RED"))