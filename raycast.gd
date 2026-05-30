extends RayCast3D
class_name InteractRay3D

@onready var label_3d: Label3D = $SpringArm3D/Label3D
@export var label_text = "🔷"

func _process(delta: float) -> void:
	if not is_colliding():
		label_3d.text = label_text
	else:
		var collider = get_collider()
		if collider is Interactable:
			collider.hover()
			label_3d.text = collider.interact_text

func do_interact():
	if is_colliding():
		var collider = get_collider()
		if collider is Interactable:
			collider.interact()
