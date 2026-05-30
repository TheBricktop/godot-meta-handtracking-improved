extends Interactable
@onready var animation_player: AnimationPlayer = $AnimationPlayer

var enabled = false

func enable():
	animation_player.play("enable")
	enabled = true

func disable():
	animation_player.play_backwards("enable")
	enabled = false

func interact():
	if enabled: global.player.global_position = global_position
	pass

func hover():
	pass
