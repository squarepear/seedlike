class_name FoodStorage
extends Node

signal food_amount_updated(category_of_food: int, amount: int)

const FOOD_EATEN_PER_DAY: int = 3

@export var _day_cycle: DayCycle
@export var _community_population: CommunityPopulation

var _current_amount_of_vegetable: int
var _current_amount_of_fruit: int
var _current_amount_of_grain: int
var _current_amount_of_protein: int


func _ready() -> void:
	_day_cycle.day_advanced.connect(_on_day_advanced)


func _on_day_advanced() -> void:
	_current_amount_of_vegetable -= FOOD_EATEN_PER_DAY * _community_population.get_population()
	_current_amount_of_fruit -= FOOD_EATEN_PER_DAY * _community_population.get_population()
	_current_amount_of_grain -= FOOD_EATEN_PER_DAY * _community_population.get_population()
	_current_amount_of_protein -= FOOD_EATEN_PER_DAY * _community_population.get_population()
	food_amount_updated.emit(0, _current_amount_of_vegetable)
	food_amount_updated.emit(1, _current_amount_of_fruit)
	food_amount_updated.emit(2, _current_amount_of_grain)
	food_amount_updated.emit(3, _current_amount_of_protein)


func add_food(amount: int, type: int) -> void:
	if type == 0: # Vegetable
		_current_amount_of_vegetable += amount
	if type == 1: # Fruit
		_current_amount_of_fruit += amount
	if type == 2: # Grain
		_current_amount_of_fruit += amount
	if type == 3: # Protein
		_current_amount_of_fruit += amount
	food_amount_updated.emit(amount, type)
