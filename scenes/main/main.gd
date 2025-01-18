class_name Main
extends Node2D

const CELL_SIZE := Vector2(32, 32)
const HALF_CELL_SIZE := Vector2(16, 16)
const QUARTER_CELL_SIZE := Vector2(8, 8)
const TRACK_CARD_SIZE := Vector2(32, 64)

@onready var track_card_mover: TrackCardMover = $TrackCardMover
@onready var track_card_spawner: TrackCardSpawner = $TrackCardSpawner
@onready var circuit_manager: CircuitManager = $CircuitManager


func _ready() -> void:
	track_card_spawner.track_card_spawned.connect(track_card_mover.setup_track_card)
	track_card_spawner.track_card_spawned.connect(circuit_manager.setup_track_card)
	
