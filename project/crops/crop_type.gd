class_name CropType
extends Resource

@export var name: String
@export var seed_packet_amount := 1
@export var food_yield := Vector2i(1, 1)

@export var stages: Array[StageInfo]
@export var seed_packet_foreground: Texture2D
@export var seed_packet_background: Color


func get_total_time_to_grow() -> int:
	return stages.reduce((func(total: int, x: StageInfo): return total + x.stage_length), 0)


func get_current_stage(age: int) -> StageInfo:
	for stage in stages:
		age -= stage.stage_length

		if age < 0:
			return stage

	return stages.back()


func get_food_yield() -> int:
	return randi_range(food_yield.x, food_yield.y)
