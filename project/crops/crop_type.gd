class_name CropType
extends Resource

@export var name: String
@export var stages: Array[StageInfo]


func get_total_time_to_grow() -> int:
	return stages.reduce((func(total: int, x: StageInfo): return total + x.stage_length), 0)


func get_current_stage(age: int) -> StageInfo:
	for stage in stages:
		age -= stage.stage_length

		if age < 0:
			return stage

	return stages.back()
