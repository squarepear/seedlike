class_name Plot
extends StaticBody3D

@export var _inventory: Inventory

var _planted_crop_type: CropType


func _plant(seed: CropType) -> void:
	_planted_crop_type = seed
	%Label3D.text = seed.name


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
		
