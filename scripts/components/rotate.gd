class_name Rotate
extends Node

@export var enabled: bool = true
@export var target: Area2D


func _ready() -> void:
	assert(target, "No target set for Rotate component")
	target.input_event.connect(_on_target_input_event.unbind(1))


func _rotate_card() -> void:
	target.rotate(deg_to_rad(90))


func _on_target_input_event(_vieport: Node, event: InputEvent) -> void:
	if not enabled:
		return

	var dragging_object := get_tree().get_first_node_in_group("dragging")
	if not target.dragging and dragging_object:
		return

	if event.is_action_pressed("rotate"):
		get_viewport().set_input_as_handled()
		_rotate_card()
