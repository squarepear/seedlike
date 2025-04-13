class_name CommunityPopulation
extends Node

@export var _day_cycle: DayCycle

var _population := 1


func _ready() -> void:
	_day_cycle.day_advanced.connect(_on_day_advanced)


func get_population() -> int:
	return _population


func add_people(amount := 1) -> void:
	_population += amount


func _on_day_advanced() -> void:
	add_people(1)
