
extends TextureButton

onready var knight = get_node("/root/mainControl/battleArena/kampf/Knight")
var potions = []
	
var offset = 0

func _ready():
	connect("pressed", self, "activatePotion")
	updateLabels()
	

func updateLabels():
	get_node("Label").set_text(str(potions.size()))
	
func activatePotion():
	if potions.size() > offset:
		knight.selectedPotions.append(potions[offset])
		potions.remove(offset)
	updateLabels()


