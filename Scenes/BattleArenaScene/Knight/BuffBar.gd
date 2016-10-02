
extends Control
onready var buffs = get_parent().buffs


func _ready():
	
	pass

func arrangeBuffs():
	for c in get_children():
		if buffs.find(c) == -1:
			remove_child(c)
	for b in buffs:
		if get_children().find(b) == -1:
			add_child(b)
			
	var count = get_child_count()
	var width = get_size().x
	var space = width / 9
	var i = 0
	
	for c in get_children():
#		c.set_pos(Vector2((width - (buffSize * count + (count - 1) * space)) / 2 + i * (buffSize + space), 0))
		c.set_pos(Vector2((width - ((count - 1) * space)) / 2 + i * space, 0))
		i += 1
