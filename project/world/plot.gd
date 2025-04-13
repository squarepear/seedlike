class_name Plot
extends StaticBody3D

const CROP_SCENE := preload("res://crops/crop.tscn")

var _inventory: Inventory
var _day_cycle: DayCycle

var _planted_crop_type: CropType


func setup(inventory: Inventory, day_cycle: DayCycle) -> void:
	_inventory = inventory
	_day_cycle = day_cycle


func _plant(seed: CropType) -> void:
	_planted_crop_type = seed
	_create_crop(seed)


func _try_plant() -> void:
	if _planted_crop_type:
		return
	
	var selected_seed := _inventory.get_selected_seed()
	if not selected_seed:
		return
	
	_plant(selected_seed)


func _on_click_detector_input_event(camera: Node, event: InputEvent, event_position: Vector3, normal: Vector3, shape_idx: int) -> void:
	if event.is_action_pressed("click"):
		_try_plant()


func _create_crop(crop_type: CropType) -> void:
	var crop := CROP_SCENE.instantiate()
	add_child(crop)
	crop.set_crop_type(crop_type)
