extends Control

@export var _inventory: Inventory
@export var _day_cycle: DayCycle

@export var seed_options: Array[CropType]

@onready var _seed_packet_container := %SeedPacketContainer


func _ready() -> void:
	for i in _seed_packet_container.get_child_count():
		_seed_packet_container.get_child(i).set_seed(seed_options[i])
		_seed_packet_container.get_child(i).set_amount(seed_options[i].seed_packet_amount)
		_seed_packet_container.get_child(i).pressed.connect(_on_seed_packet_pressed.bind(seed_options[i]))
	_day_cycle.day_advanced.connect(_on_day_advanced)


func _on_seed_packet_pressed(crop_type: CropType) -> void:
	_inventory.add_seed(crop_type, crop_type.seed_packet_amount)
	hide()


func _on_day_advanced() -> void:
	show()
