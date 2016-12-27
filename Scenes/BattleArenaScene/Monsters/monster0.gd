extends "res://Scenes/BattleArenaScene/Monsters/monster.gd"


onready var animSp = get_node("AnimatedSprite")

func _ready():
	animSp.play(animSp.get_animation())


func getTexture():
	return(animSp)

func setAnimationspeed(speed):
	animSp.get_sprite_frames().set_animation_speed("Idle64", speed * 20)
	animP.set_speed(speed)
