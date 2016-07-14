
extends Node2D

var ges = Vector2(-randi() %80 -20, -randi() %100 -20)
var gravity = 100
var bes = Vector2(0, gravity)

var r = randf()
var factorLandingpos = r * 200 + 100 # abstand + kampfflaeche + tabcontainer muessen hoehe bildschirm ergeben

var flyingTimeUp
var flyingTime
var posAfterLanding = Vector2()
var spawnPos = Vector2()

var sizeAfterLanding
var sizemax = 2
var sizemin = 0.5
var sizeChange = Vector2()

var timer = Timer.new()

func _ready():
	timer.set_wait_time(5)
	timer.start()
	set_pos(get_parent().get_node("kampf").get_child(1).get_pos())
	spawnPos = get_pos()
	calculateMovement()
	set_process(true)
	

func _process(delta):
	#set_scale(get_scale() + sizeChange * (delta / flyingTime))                                      #(factorLandingpos - spawnPos) * (delta / flyingTime)
	
	set_pos(get_pos() + ges * delta)
	if ges.y  > 0 and get_pos().y >= factorLandingpos:
		get_parent().get_node("Assistant").appendInformation(get_pos(), get_scale())
		print("realTimer: ", timer.get_time_left())
		print("realLPos: ", get_pos())
		set_process(false)
	
	ges = ges + bes * delta
	
func calculateMovement():
	var posAfterMoveUp
	var distanceDown
	
	flyingTimeUp = abs(ges.y) / bes.y
	posAfterMoveUp = spawnPos.y + (0.5 * flyingTimeUp * ges.y)
	distanceDown = factorLandingpos - posAfterMoveUp
	flyingTime = sqrt(distanceDown / bes.y) + ges.y / bes.y
	posAfterLanding = Vector2(spawnPos.x + flyingTime * ges.x, factorLandingpos)
	
	print("calculatedPosAL: ", posAfterLanding)
	print("expectedFlyingtime: ", flyingTime)
	scaleCalculation()
	
func scaleCalculation():
	var maxDiffLandingpos = 300 / spawnPos.y
	var minDiffLandingpos = 100 / spawnPos.y
	
	sizeAfterLanding = ((1.5 / (sizemax - sizemin)) * (factorLandingpos / spawnPos.y)) + 0.5
	sizeChange = sizeAfterLanding * get_scale() - get_scale()
	#print("sizeShouldBe: ", sizeAfterLanding)
	#print("sizeWillChange: ", sizeChange)