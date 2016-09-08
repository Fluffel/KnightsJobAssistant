
extends Node2D

var ges = Vector2(-randi() %80 -20, -randi() %100 -20)
var gravity = 150
var bes = Vector2(0, gravity)

var r = randf()
var factorLandingpos = r * 200 + 100 # abstand + kampfflaeche + tabcontainer muessen hoehe bildschirm ergeben

var flyingTimeUp
var flyingTime
var posAfterLanding = Vector2()
var spawnPos = Vector2()

var sizeAfterLanding
var sizemax = 1.25
var sizemin = 0.75
var sizeChange = Vector2()

var timer = Timer.new()

func _ready():
	timer.set_wait_time(5)
	timer.start()
	set_pos(get_parent().get_parent().get_node("kampf").get_child(1).get_pos())
	spawnPos = get_pos()
	calculateMovement()
	set_process(true)
	

func _process(delta):
	set_scale(get_scale() + sizeChange * (delta / flyingTime))                                      #(factorLandingpos - spawnPos) * (delta / flyingTime)
	
	set_pos(get_pos() + ges * delta)
	if ges.y  > 0 and get_pos().y >= factorLandingpos:
		#print("ges.x war: ", ges.x * delta)
		get_parent().get_parent().get_node("assistant").appendInformation(self)
		#print("realTimer: ", timer.get_time_left())
		#print("realLPos: ", get_pos())
		set_process(false)
	
	ges = ges + bes * delta
	
func calculateMovement():
	var posAfterMoveUp
	var distanceDown
#	print ("ges.: ", ges.y)
#	print ("bes.: ", bes.y)
#	print ("Landingos: ", factorLandingpos)
#	print ("spawnPos: ", spawnPos)
	
	flyingTimeUp = abs(ges.y) / bes.y
	#print ("flyingTimeUp: ", flyingTimeUp)
	posAfterMoveUp = spawnPos.y + (0.5 * flyingTimeUp * ges.y)
	#print ("posAfterMoveUp: ", posAfterMoveUp)
	if posAfterMoveUp >= factorLandingpos:
		distanceDown = 0
		#print ("distanceDown: ", distanceDown)
		flyingTime = flyingTimeUp
		posAfterLanding = Vector2(spawnPos.x + flyingTime * ges.x, posAfterMoveUp)
	else:
		distanceDown = factorLandingpos - posAfterMoveUp
		#print ("distanceDown: ", distanceDown)
		flyingTime = sqrt(distanceDown / (0.5 * bes.y)) + flyingTimeUp
		posAfterLanding = Vector2(spawnPos.x + flyingTime * ges.x, factorLandingpos)
	
#	print("calculatedPosAL: ", posAfterLanding)
#	print("expectedFlyingtime: ", flyingTime)
	scaleCalculation()
	
func scaleCalculation():
	var maxDiffLandingpos = 300 / spawnPos.y
	var minDiffLandingpos = 100 / spawnPos.y # max und min in factorLandinpos definiert
	
	sizeAfterLanding = (sizemax - sizemin) * ((factorLandingpos / spawnPos.y) - 100 / spawnPos.y) + sizemin #lineare funktion: (steigung) * ((verhaeltnis der landepos zur sartpos) - kleinstes verhaeltnis) + niedrigster wert
	sizeChange = sizeAfterLanding * get_scale() - get_scale()
	#print("sizeShouldBe: ", sizeAfterLanding)
	#print("sizeWillChange: ", sizeChange)