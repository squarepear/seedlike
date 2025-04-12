class_name Plot
extends StaticBody3D

@export var _inventory: Inventory

var _planted_crop: Crop


func _plant(crop: Crop) -> void:
	_planted_crop = crop
	%Label3D.text = crop.name


func _try_plant() -> void:
	if _planted_crop:
		return
	
	var selected_crop := _inventory.get_selected_crop()
	if not selected_crop:
		return
	
	_plant(selected_crop)


func _on_click_detector_input_event(camera: Node, event: InputEvent, event_position: Vector3, normal: Vector3, shape_idx: int) -> void:
	if event.is_action_pressed("click"):
		_try_plant()
		
