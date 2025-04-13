class_name SeedPacket
extends Button

var _seed : CropType
@onready var _name_label = %NameLabel
@onready var _seed_texture = %SeedTexture
@onready var _background = %BackgroundPanel


func set_seed(seed: CropType) -> void:
	_seed = seed
	_update_visuals()


func _update_visuals() -> void:
	_name_label.text = _seed.name
	_seed_texture.texture = _seed.seed_packet_foreground
	_background.color = _seed.seed_packet_background
