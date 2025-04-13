class_name PlotGenerator
extends Node3D

const PLOT_SCENE := preload("res://world/plot.tscn")

@export var _height: int
@export var _width: int

@export var _inventory: Inventory
@export var _day_cycle: DayCycle


func _ready() -> void:
	_generate_plots()


func _generate_plots():
	for x in _height:
		for z in _width:
			_create_new_plot(x - (_width - 1) / 2, z - (_height - 1) / 2)


func _create_new_plot(x, z):
	var _plot := PLOT_SCENE.instantiate()
	add_child(_plot)
	_plot.setup(_inventory, _day_cycle)
	_plot.position = Vector3(x, 0, z)
