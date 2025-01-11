extends Node

var target_zoom:= 2.0

@export var camera: Camera2D
const MIN_ZOOM := 1.0
const MAX_ZOOM := 3.0
const ZOOM_INCREMENT := 1.0
const ZOOM_RATE := 16.0

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("zoom_in"):
		zoom_in()

	if event.is_action_pressed("zoom_out"):
		zoom_out()


func _physics_process(delta: float) -> void:
	camera.zoom = lerp(
		camera.zoom,
		target_zoom * Vector2.ONE,
		ZOOM_RATE * delta
	)

	set_physics_process(
		not is_equal_approx(camera.zoom.x, target_zoom)
	)


func zoom_in() -> void:
	target_zoom = min(target_zoom + ZOOM_INCREMENT, MAX_ZOOM)
	set_physics_process(true)


func zoom_out() -> void:
	target_zoom = max(target_zoom - ZOOM_INCREMENT, MIN_ZOOM)
	set_physics_process(true)
