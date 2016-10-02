
extends Node


func _ready():
	pass


func prepareSpecialattack(buffs, currentPotions):
	var buffs = []
	var currentPotions = []
	
	for b in buffs:
		buffs[b.type] += 1
		
	for c in currentPotions:
		self.currentPotions[c.type] += 1
		
	initializeSpecialattack()
	
	
func initializeSpecialattack():
	pass
