extends "res://Scenes/BattleArenaScene/Monsters/monster.gd"

onready var sp = get_node("Sprite")


func getTexture():
	return(sp)

func setAnimationspeed(speed):
	animP.set_speed(speed)