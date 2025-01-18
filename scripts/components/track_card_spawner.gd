class_name TrackCardSpawner
extends Node

signal track_card_spawned(track_card: TrackCard)

const TRACK_CARD = preload("res://scenes/track_cards/track_card.tscn")

@export var play_area: PlayArea


func _get_first_available_area() -> PlayArea:
	if not play_area.track_card_grid.is_grid_full():
		return play_area

	return null


func spawn_track_card(track_card: TrackCardStats) -> void:
	var area := _get_first_available_area()

	var new_track_card := TRACK_CARD.instantiate()
	var tile := area.track_card_grid.get_first_empty_tile()

	area.track_card_grid.add_child(new_track_card)
	area.track_card_grid.add_track_card(tile, new_track_card)
	new_track_card.global_position = area.get_global_from_tile(tile)
	new_track_card.stats = track_card

	track_card_spawned.emit(new_track_card)
