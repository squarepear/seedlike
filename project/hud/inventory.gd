class_name Inventory
extends Node

signal seed_added(crop_type: CropType, amount: int)
signal seed_removed(crop_type: CropType, amount: int)

@export var _seeds: Dictionary[CropType, int] = {}
var _selected_seed: CropType


func add_seed(crop_type: CropType, amount: int) -> void:
	var current_seeds: int = _seeds.get_or_add(crop_type, 0)
	_seeds[crop_type] = current_seeds + amount
	seed_added.emit(crop_type, amount)


func remove_seed(crop_type: CropType) -> void:
	var current_seeds: int = _seeds.get_or_add(crop_type, 0)
	
	if current_seeds == 0:
		return
	
	_seeds[crop_type] = current_seeds - 1
	seed_removed.emit(crop_type, 1)

	if _seeds[crop_type] <= 0 and _selected_seed == crop_type:
		_selected_seed = null


func get_seed_amount(crop_type: CropType) -> int:
	return _seeds.get_or_add(crop_type, 0)


func has_seed(crop_type: CropType) -> bool:
	return _seeds.get_or_add(crop_type, 0) > 0


func set_selected_seed(crop_type: CropType) -> void:
	_selected_seed = crop_type


func get_selected_seed() -> CropType:
	return _selected_seed


func get_seeds() -> Array[CropType]:
	return _seeds.keys()
