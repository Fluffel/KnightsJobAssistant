
extends TabContainer
var oldTab = 0
var open = false;
onready var pt = get_parent()
onready var anim = pt.get_node("anim")

func _ready():
	self.connect("tab_changed" ,self, "start_anim")
	set_size(Vector2(get_size().x, pt.get_size().y))
	anim.get_animation("TabContainer_moveUp").track_set_key_value(0,0,get_pos())

func start_anim(tabID):
	print("----------")
	print(tabID)
	print(open)
	if not open:
		anim.play("TabContainer_moveUp")
		open = true
	elif tabID == oldTab:
		anim.play("TabContainer_moveUp", -1, -1, true)
		open = false
	oldTab = tabID
	print("Dann")
	print(tabID)
	print(open)