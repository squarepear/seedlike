class_name PlotGenerator
extends Node3D

const PLOT_SCENE := preload("res://world/plot.tscn")

@export var _height: int
@export var _width: int

@export var _inventory: Inventory
@export var _day_cycle: DayCycle
@export var _food_storage: FoodStorage


func _ready() -> void:
	_generate_plots()


func _generate_plots() -> void:
	for x in _height:
		for z in _width:
			_create_new_plot(x - (_width - 1) / 2.0, z - (_height - 1) / 2.0)


func _create_new_plot(x: int, z: int) -> void:
	var _plot := PLOT_SCENE.instantiate()
	add_child(_plot)
	_plot.setup(_inventory, _day_cycle, _food_storage)
	_plot.position = Vector3(x, 0, z)
