extends Control

const SEED_BUTTON_SCENE := preload("res://hud/seed_button.tscn")

@export var _inventory: Inventory
@export var _day_cycle: DayCycle


func _ready():
	_set_seed_buttons()


func _set_seed_buttons() -> void:
	var seeds := _inventory.get_seeds()
	for seed in seeds:
		_create_seed_button(seed)


func _create_seed_button(seed: CropType) -> void:
	var seed_button := SEED_BUTTON_SCENE.instantiate()
	%VBoxContainer.add_child(seed_button)
	seed_button.set_seed(seed)
	seed_button.pressed.connect(_select_seed.bind(seed))


func _select_seed(seed: CropType) -> void:
	_inventory.set_selected_seed(seed)


func _on_advance_day_button_pressed() -> void:
	_day_cycle.advance_day()
