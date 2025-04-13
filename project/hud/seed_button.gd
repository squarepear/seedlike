extends Button


func set_seed(seed: CropType) -> void:
	text = seed.name + "  "


func set_amount(amount: int) -> void:
	text[-1] = str(amount)
