@tool
class_name TrackCard
extends Area2D

@export var stats: TrackCardStats : set = set_stats

@onready var card_skin: Sprite2D = $CardSkin
@onready var drag_and_drop: DragAndDrop = $DragAndDrop

var dragging := false
var card_orientation := 0

func set_stats(value: TrackCardStats) -> void:
	stats = value

	if value == null:
		return

	if not is_node_ready():
		await ready

	card_skin.region_rect.position = Vector2(stats.skin_coordinates) * Main.CELL_SIZE


func reset_after_dragging(starting_position: Vector2) -> void:
	global_position = starting_position


func rotate_card(deg) -> void:
	rotate(deg_to_rad(deg))
	card_orientation += 1
	if card_orientation == 4:
		card_orientation = 0


func _on_drag_and_drop_drag_started() -> void:
	dragging = true


func _on_drag_and_drop_dropped(starting_position: Vector2) -> void:
	dragging = false
