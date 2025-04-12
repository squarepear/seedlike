class_name Inventory
extends Node

@export var _crops: Array[Crop] = []
var _selected_crop: Crop


func add_crop(new_crop: Crop, number_of_crops: int) -> void:
	_crops.append(new_crop)


func set_selected_crop(crop: Crop) -> void:
	_selected_crop = crop


func get_selected_crop() -> Crop:
	return _selected_crop


func get_crop_types() -> Array[Crop]:
	return _crops
