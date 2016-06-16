
extends Control

# member variables here, example:
# var a=2
# var b="textvar"

onready var tabButtons = get_node("TabButtons")
onready var tabs =  get_node("AppantTabsHere")
onready var childs = tabs.get_children()

func _ready():
	if tabs.get_child_count() > 0:
		for ch in childs:
			tabButtons.add_button(ch.get_name())
			
		tabButtons.connect("button_selected",self,"changeTab")
		tabButtons.set_selected(0)
		changeTab(0)
	
func changeTab(buttonID):
	var id = 0
	for ch in childs:
		if id == buttonID:
			ch.show()
		else:
			ch.hide()
		id += 1


