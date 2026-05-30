extends Interactable
@onready var animation_player: AnimationPlayer = $AnimationPlayer

func interact():
	super.interact()
	animation_player.play("press")

func hover():
	animation_player.play("hover")
