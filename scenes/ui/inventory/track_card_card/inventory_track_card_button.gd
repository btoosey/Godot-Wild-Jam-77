class_name InventoryTrackCardButton
extends TextureButton

@export var track_card_stats: TrackCardStats

@onready var quantity_label: Label = $QuantityLabel


func _ready() -> void:
	quantity_label.text = str(PlayerInventory.inventory_card_quantity[track_card_stats.card_type])
	texture_normal.region.position = Vector2(track_card_stats.skin_coordinates) * Main.TRACK_CARD_SIZE
	texture_disabled.region.position = Vector2(track_card_stats.skin_coordinates) * Main.TRACK_CARD_SIZE


func _process(_delta: float) -> void:
	if PlayerInventory.inventory_card_quantity[track_card_stats.card_type] == 0:
		disabled = true
