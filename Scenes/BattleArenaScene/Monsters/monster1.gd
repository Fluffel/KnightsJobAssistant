extends "res://Scenes/BattleArenaScene/Monsters/monster.gd"

func _ready():
	var animSp = get_node("AnimatedSprite")
	
	animSp.play(animSp.get_animation())