class_name FoodStorage
extends Node

signal food_amount_updated(current_amount_of_food: int)

const FOOD_EATEN_PER_DAY: int = 3

@export var _day_cycle: DayCycle
@export var _community_population: CommunityPopulation

var _current_amount_of_food: int = 10


func _ready() -> void:
	_day_cycle.day_advanced.connect(_on_day_advanced)
	food_amount_updated.emit.call_deferred(_current_amount_of_food)


func _on_day_advanced() -> void:
	_current_amount_of_food -= FOOD_EATEN_PER_DAY * _community_population.get_population()
	_current_amount_of_food = clamp(_current_amount_of_food, 0, 100)
	food_amount_updated.emit(_current_amount_of_food)


func add_food(amount: int) -> void:
	_current_amount_of_food += amount
	food_amount_updated.emit(_current_amount_of_food)
