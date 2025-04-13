class_name DayCycle
extends Node

signal day_advanced

var _day: int = 0


func advance_day():
	_day += 1
	day_advanced.emit()
