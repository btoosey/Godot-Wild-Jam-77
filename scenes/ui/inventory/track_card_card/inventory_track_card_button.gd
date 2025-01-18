class_name InventoryTrackCardButton
extends TextureButton

@export var track_card_stats: TrackCardStats

@onready var quantity_label: Label = $QuantityLabel
@onready var track_card_spawner: TrackCardSpawner = %TrackCardSpawner


func _ready() -> void:
	update_quantity()
	quantity_label.text = str(PlayerInventory.inventory_card_quantity[track_card_stats.card_type])
	texture_normal.region.position = Vector2(track_card_stats.skin_coordinates) * Main.TRACK_CARD_SIZE
	texture_disabled.region.position = Vector2(track_card_stats.skin_coordinates) * Main.TRACK_CARD_SIZE


func _process(_delta: float) -> void:
	if PlayerInventory.inventory_card_quantity[track_card_stats.card_type] == 0:
		disabled = true


func _on_pressed() -> void:
	PlayerInventory.inventory_card_quantity[track_card_stats.card_type] -= 1
	update_visuals()
	update_quantity()
	track_card_spawner.spawn_track_card(track_card_stats)


func update_quantity() -> void:
	if PlayerInventory.inventory_card_quantity[track_card_stats.card_type] == 0:
		disabled = true
	else:
		disabled = false


func update_visuals() -> void:
	quantity_label.text = str(PlayerInventory.inventory_card_quantity[track_card_stats.card_type])
