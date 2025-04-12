extends Control

const SEED_BUTTON_SCENE := preload("res://hud/seed_button.tscn")

@export var _inventory: Inventory


func _ready():
	_set_seed_buttons()


func _set_seed_buttons() -> void:
	var crop_types := _inventory.get_crop_types()
	for crop in crop_types:
		_create_seed_button(crop)


func _create_seed_button(crop) -> void:
	var seed_button := SEED_BUTTON_SCENE.instantiate()
	%VBoxContainer.add_child(seed_button)
	seed_button.set_seed_type(crop)
