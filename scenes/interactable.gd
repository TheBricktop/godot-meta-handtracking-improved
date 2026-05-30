extends Node3D
class_name Interactable

signal act

@export var interact_text = "press"

func interact():
	act.emit()
	print("interacted")
	pass

func hover():
	pass
