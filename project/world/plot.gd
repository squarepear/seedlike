extends StaticBody3D


func _on_click_detector_input_event(camera: Node, event: InputEvent, event_position: Vector3, normal: Vector3, shape_idx: int) -> void:
	if event.is_action_pressed("click"):
		print("AEIOU")
		
