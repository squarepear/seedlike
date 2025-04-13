extends Sprite3D

var _crop_type: CropType
var _current_age: int = 0


func set_crop_type(crop_type: CropType) -> void:
	_crop_type = crop_type
	%Label3D.text = _crop_type.name
	texture = crop_type.stages[0].stage_texture
	offset.y = crop_type.stages[0].stage_texture.get_height() / 2


func age_up():
	_current_age += 1
