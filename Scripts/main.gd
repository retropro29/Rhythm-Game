extends Node2D

_ready():
	global.beat.connect(_on_Conductor_beat)
	global.measure.connect(_on_Conductor_measure)
