
extends Button

# member variables here, example:
# var a=2
# var b="textvar"

func _ready():
	self.connect("pressed",self,"L")
	
func L():
	print("var what")


