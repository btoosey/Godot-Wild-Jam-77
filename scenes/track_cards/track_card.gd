@tool
class_name TrackCard
extends Area2D

@export var stats: TrackCardStats : set = set_stats

@onready var card_skin: Sprite2D = $CardSkin
@onready var drag_and_drop: DragAndDrop = $DragAndDrop
@onready var circuit_link_1: Marker2D = $CircuitLinks/CircuitLink1
@onready var circuit_link_2: Marker2D = $CircuitLinks/CircuitLink2


var dragging := false
var card_orientation := 0

var secondary_card_halves = {
	0: Vector2i(0, 1),
	1: Vector2i(-1, 0),
	2: Vector2i(0, -1),
	3: Vector2i(1, 0)
}


func set_stats(value: TrackCardStats) -> void:
	stats = value

	if value == null:
		return

	if not is_node_ready():
		await ready

	card_skin.region_rect.position = Vector2(stats.skin_coordinates) * Main.TRACK_CARD_SIZE

	circuit_link_1.position = stats.link_1
	circuit_link_2.position = stats.link_2


func reset_after_dragging(starting_position: Vector2, orientation: int) -> void:
	while orientation != card_orientation:
		rotate_card(90)
	global_position = starting_position


func rotate_card(deg) -> void:
	rotate(deg_to_rad(deg))
	card_orientation += 1
	if card_orientation == 4:
		card_orientation = 0


func _on_drag_and_drop_drag_started() -> void:
	dragging = true
	#circuit_manager.remove_from_circuit(self)


func _on_drag_and_drop_dropped(_starting_position: Vector2) -> void:
	dragging = false
