
extends Control

# variablen deklination

var items = []
var speed = 1
var move = 0
var midOfAssistant = Vector2()
var startPos = Vector2()
var richtung = Vector2()
var state = 0


func _ready():
	print("wichtig", get_size())
	midOfAssistant = get_pos() + 0.5 * get_size()

func appendInformation(item):
	items.append(item)
	if is_processing() == false:
		makeReadyToWalk()
		set_process(true)

func makeReadyToWalk():
	startPos = get_pos()
	richtung = items[0].get_pos() - midOfAssistant

	move = 0
	
func _process(delta):
	set_pos(richtung * move + startPos)
	if items.size() > 0:
		midOfAssistant = get_pos() + 0.5 * get_size() 
		if midOfAssistant.distance_to(items[0].get_pos()) < 25: 
			collectItem()
	move = move + speed * delta

func collectItem():
	get_parent().get_node("items").remove_child(items[0])
	items.remove(0)
	if items.empty():
		set_process(false)
	else:
		makeReadyToWalk()
