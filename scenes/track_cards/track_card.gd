@tool
class_name TrackCard
extends Area2D

@export var stats: TrackCardStats : set = set_stats

@onready var card_skin: Sprite2D = $CardSkin

var dragging := false
var card_rotation := 0

func set_stats(value: TrackCardStats) -> void:
	stats = value

	if value == null:
		return

	if not is_node_ready():
		await ready

	card_skin.region_rect.position = Vector2(stats.skin_coordinates) * Main.CELL_SIZE


func _on_drag_and_drop_drag_started() -> void:
	dragging = true


func _on_drag_and_drop_dropped(starting_position: Vector2) -> void:
	dragging = false
