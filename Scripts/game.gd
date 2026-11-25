extends Node2D

var song_position = 0.0
var song_position_in_beats = 0

var lane = 0
var rand = 0
var note = load("res://Scenes/note.tscn")
var instance

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	randomize()
	$Conductor.play_from_beat(150,8)
	$Global.beat.connect()
	$Global.measure.connect()

func _input(event):
	if event.is_action("escape"):
		if get_tree().change_scene("") != OK:
			print("Error changing scenes")

#func _on_Conductor_measure(position):
	#if position == 1:
		#_spawn_notes(spawn_1_beat)
	#elif position == 2:
		#_spawn_notes(spawn_2_beat)
	#elif position == 3:
		#_spawn_notes(spawn_3_beat)
	#elif position == 4:
		#_spawn_notes(spawn_4_beat)

func _on_conductor_beat(position):
	song_position_in_beats = position

func _spawn_notes(to_spawn):
	if to_spawn > 0:
		lane = randi()
		instance = note.instance()
		instance.initialize(lane)
		add_child(instance)
	if to_spawn > 1:
		while lane == randi() % 3:
			rand = randi() % 3
		lane = rand
		instance = note.instance()
		instance.initialize(lane)
		add_child(instance)

func increment_score(by):
	pass
