extends AnimatedSprite3D

var _crop_type: CropType


func set_crop_type(crop_type: CropType) -> void:
	_crop_type = crop_type
	%Label3D.text = _crop_type.name
