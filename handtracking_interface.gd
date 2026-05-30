extends StartXR

const CAPSULE_MATERIAL = preload("res://capsule_material.tres")

@onready var left_hand_aim_controller: XRController3D = $XROrigin3D/LeftHandAimController
@onready var right_hand_aim_controller: XRController3D = $XROrigin3D/RightHandAimController

@onready var left_interact_ray: InteractRay3D = $XROrigin3D/LeftHandAimController/Interact_Ray
@onready var right_interact_ray: InteractRay3D = $XROrigin3D/RightHandAimController/Interact_Ray


@onready var left_hand_tracker: XRNode3D = $XROrigin3D/LeftHandTracker
@onready var left_hand_skeleton: OpenXRFbHandTrackingMesh = $XROrigin3D/LeftHandTracker/OpenXRFbHandTrackingMesh

@onready var right_hand_tracker: XRNode3D = $XROrigin3D/RightHandTracker
@onready var right_hand_skeleton: OpenXRFbHandTrackingMesh = $XROrigin3D/RightHandTracker/OpenXRFbHandTrackingMesh

var fb_capsule_ext
var left_capsules_loaded := false
var right_capsules_loaded := false


func _ready() -> void:
	super._ready()
	global.handController = self
	
	if xr_interface and xr_interface.is_initialized():
		fb_capsule_ext = Engine.get_singleton("OpenXRFbHandTrackingCapsulesExtension")

	left_hand_skeleton.openxr_fb_hand_tracking_mesh_ready.connect(_add_mesh_group.bind(left_hand_skeleton, "hand_mesh_left"))
	right_hand_skeleton.openxr_fb_hand_tracking_mesh_ready.connect(_add_mesh_group.bind(right_hand_skeleton, "hand_mesh_right"))
	#toggle_capsule_visibility()

func _add_mesh_group(p_parent: Node3D, p_group: String) -> void:
	for child in p_parent.get_children():
		if child is MeshInstance3D:
			child.add_to_group(p_group)



func _on_left_hand_aim_controller_input_float_changed(name: String, value: float) -> void:
	match name:
		"index_pinch_strength":
			pass
		"middle_pinch_strength":
			pass
		"ring_pinch_strength":
			pass
		"little_pinch_strength":
			pass


func _on_right_hand_aim_controller_input_float_changed(name: String, value: float) -> void:
	match name:
		"index_pinch_strength":
			pass
		"middle_pinch_strength":
			pass
		"ring_pinch_strength":
			pass
		"little_pinch_strength":
			pass


func _on_left_hand_aim_controller_button_pressed(name: String) -> void:
	match name:
		"menu_pressed":
			pass
		"menu_gesture":
			pass
		"index_pinch":
			left_interact_ray.do_interact()
			pass
		"middle_pinch":
			pass
		"ring_pinch":
			pass
		"little_pinch":
			pass



func _on_right_hand_aim_controller_button_pressed(name: String) -> void:
	match name:
		"system_gesture":
			pass
		"index_pinch":
			right_interact_ray.do_interact()
			pass
		"middle_pinch":
			pass
		"ring_pinch":
			pass
		"little_pinch":
			pass


func _on_right_hand_aim_controller_button_released(name: String) -> void:
	match name:
		"system_gesture":
			pass
		"index_pinch":
			pass
		"middle_pinch":
			pass
		"ring_pinch":
			pass
		"little_pinch":
			pass

func _on_left_hand_aim_controller_button_released(name: String) -> void:
	match name:
		"system_gesture":
			pass
		"index_pinch":
			pass
		"middle_pinch":
			pass
		"ring_pinch":
			pass
		"little_pinch":
			pass

func toggle_capsule_visibility():
	for hand_capsule in get_tree().get_nodes_in_group("hand_capsule_left"):
		hand_capsule.visible = not hand_capsule.visible

	for hand_capsule in get_tree().get_nodes_in_group("hand_capsule_right"):
		hand_capsule.visible = not hand_capsule.visible
	
