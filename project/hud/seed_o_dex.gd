@tool
class_name SeedODex
extends Container

const SEED_PACKET_SCENE := preload("res://hud/seed_packet.tscn")

@export var _inventory: Inventory


func _ready() -> void:
	clip_contents = true

	if Engine.is_editor_hint():
		_update_seed_packets()


func _process(_delta: float) -> void:
	for i in get_child_count():
		var child: Control = get_child(i)
		# print(child_size)
		child.position.x = (size.x - child.size.x) / 2.0
		child.position.y = i * ((size.y - child.size.y) / (get_child_count() - 1))


func set_inventory(inventory: Inventory) -> void:
	_inventory = inventory

	_update_seed_packets()


func _update_seed_packets() -> void:
	for child in get_children():
		remove_child(child)

	if Engine.is_editor_hint():
		for i in 5: _create_and_add_seed_packet(null)
		return

	if not _inventory:
		return

	for seed in _inventory.get_seeds():
		_create_and_add_seed_packet(seed)


func _create_and_add_seed_packet(seed: CropType) -> SeedPacket:
	var seed_packet: SeedPacket = SEED_PACKET_SCENE.instantiate()
	add_child(seed_packet)

	if seed and not Engine.is_editor_hint():
		seed_packet.connect_inventory(_inventory, seed)
		seed_packet.pressed.connect(_on_seed_packet_pressed.bind(seed))

	return seed_packet


func _on_seed_packet_pressed(seed: CropType) -> void:
	_inventory.set_selected_seed(seed)
