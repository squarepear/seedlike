class_name Crop
extends Sprite3D

signal harvested(food_yield: int)

var _crop_type: CropType
var _current_age: int = 0


func set_crop_type(crop_type: CropType) -> void:
	_crop_type = crop_type
	_set_stage(crop_type.stages[0])


func _set_stage(stage_info: StageInfo) -> void:
	texture = stage_info.stage_texture
	offset.y = stage_info.stage_texture.get_height() / 2


func age_up() -> void:
	_current_age += 1
	_set_stage(_crop_type.get_current_stage(_current_age))


func try_harvest() -> void:
	if _crop_type.get_current_stage(_current_age).is_harvestable:
		harvested.emit(_crop_type.get_food_yield())
		queue_free()
