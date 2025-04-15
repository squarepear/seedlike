extends Control

@export var _inventory: Inventory
@export var _day_cycle: DayCycle
@export var _food_storage: FoodStorage

@onready var _vegetable_bar : ProgressBar = %VegetableBar
@onready var _fruit_bar : ProgressBar = %FruitBar
@onready var _grain_bar : ProgressBar = %GrainBar
@onready var _protein_bar : ProgressBar = %ProteinBar
@onready var _seedodex: SeedODex = %SeedODex


func _ready() -> void:
	_seedodex.set_inventory(_inventory)
	_food_storage.food_amount_updated.connect(_on_food_amount_updated)


func _on_advance_day_button_pressed() -> void:
	_day_cycle.advance_day()


func _on_food_amount_updated(category_of_food: int, food_amount: int) -> void:
	if category_of_food == 0: # Vegetable
		_vegetable_bar.value += food_amount
		_vegetable_bar.value = clamp(_vegetable_bar.value, 0, 100)
	if category_of_food == 1: # Fruit
		_fruit_bar.value += food_amount
		_fruit_bar.value = clamp(_fruit_bar.value, 0, 100)
	if category_of_food == 2: # Grain
		_grain_bar.value += food_amount
		_grain_bar.value = clamp(_grain_bar.value, 0, 100)
	if category_of_food == 3: # Protein
		_protein_bar.value += food_amount
		_protein_bar.value = clamp(_protein_bar.value, 0, 100)
