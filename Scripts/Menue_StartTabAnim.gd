
extends TabContainer
var oldTab = 0
var open = false;
onready var anim = get_node("/root/hook/anim")

func _ready():
	self.connect("tab_changed",self,"start_anim")

func start_anim(tabID):
	print("----------")
	print(tabID)
	print(open)
	if not open:
		anim.play("TabContainer_moveUp")
		open = true
	elif tabID == oldTab:
		anim.play("TabContainer_moveUp",-1,-1,true)
		open = false
	oldTab = tabID
	print("Dann")
	print(tabID)
	print(open)