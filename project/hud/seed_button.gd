extends Button

signal selected(crop: Crop)

var _crop_type: Crop


func set_seed_type(crop: Crop):
	_crop_type = crop
	text = crop.name


func _on_pressed() -> void:
	selected.emit(_crop_type)
