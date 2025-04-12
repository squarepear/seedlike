class_name Inventory
extends Node

@export var _seeds: Array[CropType] = []
var _selected_seed: CropType


func add_seed(crop_type: CropType, number_of_seeds: int) -> void:
	_seeds.append(crop_type)


func set_selected_seed(crop_type: CropType) -> void:
	_selected_seed = crop_type


func get_selected_seed() -> CropType:
	return _selected_seed


func get_seeds() -> Array[CropType]:
	return _seeds
