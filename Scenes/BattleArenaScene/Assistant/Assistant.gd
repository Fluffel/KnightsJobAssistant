
extends Control

var aPos = Array()
var aScale = Array()
var speed = 1
var move = 0
var midOfAssistant = Vector2()
var startPos = Vector2()
var richtung = Vector2()
var state = 0


func _ready():
	pass

func appendInformation(pos, scale):
	aPos.append(pos)
	aScale.append(scale)
	if is_processing() == false:
		makeReadyToWalk()
		set_process(true)

func makeReadyToWalk():
	startPos = get_pos()
	richtung = aPos[0] - midOfAssistant
	#print("pos Item1: ", aPos[0])
	#print("posItemy; ", aPos[0].y)
	#print("richtung: ", richtung)
	move = 0
	
func _process(delta):
#	print(richtung)
	set_pos(richtung * move + startPos)
#	print("selta", d)
#	print("move", move)
#	print("delta", delta)
	#print(get_pos())
	midOfAssistant = get_pos() + 0.5 * get_size()
#	if state == 0:
#		printp(midOfAssistant.y, midOfAssistant.x, aPos[0].y, aPos[0].x)
#		print(midOfAssistant.x, midOfAssistant.y, aScale[0].x, aScale[0].y, aPos[0].x, aPos[0].y)
	if midOfAssistant.y <= aPos[0].y + 25 * aScale[0].y and midOfAssistant.y >= aPos[0].y - 25 * aScale[0].y and midOfAssistant.x <= aPos[0].x + 25 * aScale[0].x and midOfAssistant.x >= aPos[0].x - 25 * aScale[0].x: 
		collectItem()
	move = move + speed * delta

func collectItem():
	#print("collected")
	#print("children: ", get_parent().get_child(1))
	get_parent().remove_child(get_parent().get_child(3))
	aPos.remove(0)
	aScale.remove(0)
	if aPos.empty() == true and aScale.empty() == true:
		set_process(false)
	else:
		makeReadyToWalk()
		
		
		
func printp(Ay, Ax, Iy, Ix):
	#print("pos Assisaten: ", Ax,",", Ay)
	#print("pos Itemy: ", Iy,",", Ix)
	state = 1