class_name TrackCardMover
extends Node


@export var play_areas: Array[PlayArea]


func _ready() -> void:
	var track_cards := get_tree().get_nodes_in_group("track_cards")
	for track_card: TrackCard in track_cards:
		setup_unit(track_card)


func _get_play_area_for_position(global: Vector2) -> int:
	var dropped_area_index := -1

	for i in play_areas.size():
		var tile := play_areas[i].get_tile_from_global(global)
		if play_areas[i].is_tile_in_bounds(tile):
			dropped_area_index = i

	return dropped_area_index


func _set_highlighters(enabled: bool) -> void:
	for play_area: PlayArea in play_areas:
		play_area.tile_highlighter.enabled = enabled


func _reset_track_card_to_starting_position(starting_position: Vector2, track_card: TrackCard) -> void:
	var i := _get_play_area_for_position(starting_position)
	var tile := play_areas[i].get_tile_from_global(starting_position)

	track_card.reset_after_dragging(starting_position)
	play_areas[i].track_card_grid.add_track_card(tile, track_card)


func _move_track_card(track_card: TrackCard, play_area: PlayArea, tile: Vector2i) -> void:
	play_area.track_card_grid.add_track_card(tile, track_card)
	track_card.global_position = play_area.get_global_from_tile(tile)
	track_card.reparent(play_area.track_card_grid)


func setup_unit(track_card: TrackCard) -> void:
	track_card.drag_and_drop.drag_started.connect(_on_track_card_drag_started.bind(track_card))
	track_card.drag_and_drop.dropped.connect(_on_track_card_dropped.bind(track_card))



func _on_track_card_drag_started(track_card: TrackCard) -> void:
	_set_highlighters(true)

	var i := _get_play_area_for_position(track_card.global_position)
	if i > -1:
		var tile := play_areas[i].get_tile_from_global(track_card.global_position)
		play_areas[i].track_card_grid.remove_track_card(tile)



func _on_track_card_dropped(starting_position: Vector2, track_card: TrackCard) -> void:
	_set_highlighters(false)

	#var old_area_index := _get_play_area_for_position(starting_position)
	var drop_area_index := _get_play_area_for_position(track_card.get_global_mouse_position())

	#var old_area := play_areas[old_area_index]
	#var old_tile := old_area.get_tile_from_global(starting_position)
	var new_area := play_areas[drop_area_index]
	var new_tile := new_area.get_hovered_tile()
	#if :
			#_reset_track_card_to_starting_position(starting_position, track_card)
			#return
	if drop_area_index == -1 or play_areas[drop_area_index].track_card_grid.is_tile_occupied(new_tile):
		_reset_track_card_to_starting_position(starting_position, track_card)
		return
		#var old_unit: Unit = new_area.unit_grid.units[new_tile]
		#new_area.unit_grid.remove_unit(new_tile)
		#_move_unit(old_unit, old_area, old_tile)
	else:
		_move_track_card(track_card, new_area, new_tile)
