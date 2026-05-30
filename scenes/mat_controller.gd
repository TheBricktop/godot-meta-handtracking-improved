@tool
extends Node3D
@export var mesh_array : Array[MeshInstance3D]

@export var color = Color.WHITE : set = set_Color

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for child in get_children(true):
		if child is MeshInstance3D:
			mesh_array.append(child)

func set_Color(color):
	for mesh in mesh_array:
		var mat = mesh.get_active_material(0)
		mat.albedo_color = color
		
func _on_color_picker_button_color_changed(color: Color) -> void:
	set_Color(color)
	pass # Replace with function body.
