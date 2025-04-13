extends Control

const SEED_BUTTON_SCENE := preload("res://hud/seed_button.tscn")

@export var _inventory: Inventory
@export var _day_cycle: DayCycle
@export var _food_storage: FoodStorage

@onready var _food_bar : ProgressBar = %FoodBar


func _ready() -> void:
	_set_seed_buttons()
	_food_storage.food_amount_updated.connect(_on_food_amount_updated)


func _set_seed_buttons() -> void:
	var seeds := _inventory.get_seeds()
	for seed in seeds:
		_create_seed_button(seed)


func _create_seed_button(seed: CropType) -> void:
	var seed_button := SEED_BUTTON_SCENE.instantiate()
	%SeedContainer.add_child(seed_button)
	seed_button.set_seed(seed)
	seed_button.set_amount(_inventory.get_seed_amount(seed))
	seed_button.pressed.connect(_select_seed.bind(seed))
	_inventory.seed_added.connect(func(crop_type: CropType, _amount: int): if crop_type == seed: seed_button.set_amount(_inventory.get_seed_amount(seed)))
	_inventory.seed_removed.connect(func(crop_type: CropType, _amount: int): if crop_type == seed: seed_button.set_amount(_inventory.get_seed_amount(seed)))


func _select_seed(seed: CropType) -> void:
	_inventory.set_selected_seed(seed)


func _on_advance_day_button_pressed() -> void:
	_day_cycle.advance_day()


func _on_food_amount_updated(food_amount: int) -> void:
	_food_bar.value = food_amount
