class_name TrackCardStats
extends Resource

enum CardType {
	STRAIGHT_LONG,
	STRAIGHT_SHORT,
	C_CORNER,
	J_CORNER_SHORT,
	L_CORNER_SHORT,
	J_CORNER_LONG,
	L_CORNER_LONG,
	S_CORNER,
	Z_CORNER
	}


@export_category("Data")
@export var gold_cost := 1
@export var card_type : CardType

@export_category("Starting Link Locations")
@export var link_1: Vector2
@export var link_2: Vector2

@export_category("Visuals")
@export var skin_coordinates: Vector2i
