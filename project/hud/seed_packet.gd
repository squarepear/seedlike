class_name SeedPacket
extends Button

var _seed : CropType
@onready var _name_label = %NameLabel
@onready var _amount_label = %AmountLabel
@onready var _seed_texture = %SeedTexture
@onready var _background = %BackgroundPanel


func set_seed(seed_type: CropType) -> void:
	_seed = seed_type
	_update_visuals()


func set_amount(amount: int) -> void:
	_amount_label.text = 'x%d' % amount


func connect_inventory(inventory: Inventory, seed_type: CropType) -> void:
	set_seed(seed_type)
	set_amount(inventory.get_seed_amount(seed_type))

	var update_amount = func(crop_type: CropType, _amount: int): if crop_type == seed_type: set_amount(inventory.get_seed_amount(seed_type))

	inventory.seed_added.connect(update_amount)
	inventory.seed_removed.connect(update_amount)



func _update_visuals() -> void:
	_name_label.text = _seed.name
	_seed_texture.texture = _seed.seed_packet_foreground
	_background.color = _seed.seed_packet_background
