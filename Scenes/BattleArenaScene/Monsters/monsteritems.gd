
extends Node2D

var ges = Vector2(-randi() %80 -20, -randi() %100 -20)
var gravity = 100
var bes = Vector2(0, gravity)

func _ready():
	set_pos(get_parent().get_node("kampf").get_child(1).get_pos())
	print(get_pos())
	set_process(true)
	

func _process(delta):
	var r = randf()
	
	var factorLandingpos = r * 310 + 200 # abstand + kampfflaeche + tabcontainer muessen hoehe bildschirm ergeben
	set_pos(get_pos() + ges * delta)
	if ges.y  > 0 and get_pos().y >= factorLandingpos:
		set_process(false)
	ges = ges + bes * delta
	
