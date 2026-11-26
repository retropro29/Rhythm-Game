extends Node2D

var song_position = 0.0
var song_position_in_beats = 0

var score = 0
var combo = 0
var max_combo = 0

var great = 0
var good = 0
var meh = 0
var missed = 0

var lane = 0
var rand = 0
var note = load("res://Scenes/note.tscn")
var instance

var spawn_1_beat = 0
var spawn_2_beat = 0
var spawn_3_beat = 1
var spawn_4_beat = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	randomize()
	$Conductor.play_from_beat(0,8)
	$Global.beat.connect(_on_Conductor_beat)
	$Global.measure.connect(_on_Conductor_measure)

func _input(event):
	if event.is_action("escape"):
		if get_tree().change_scene("") != OK:
			print("Error changing scenes")

func _on_Conductor_measure(position):
	if position == 1:
		_spawn_notes(spawn_1_beat)
	elif position == 2:
		_spawn_notes(spawn_2_beat)
	elif position == 3:
		_spawn_notes(spawn_3_beat)
	elif position == 4:
		_spawn_notes(spawn_4_beat)

func _on_Conductor_beat(position):
	song_position_in_beats = position
	if song_position_in_beats > 36:
		spawn_1_beat = 0
		spawn_2_beat = 2
		spawn_3_beat = 0
		spawn_4_beat = 2
	if song_position_in_beats > 70:
		spawn_1_beat = 1
		spawn_2_beat = 1
		spawn_3_beat = 1
		spawn_4_beat = 1
	if song_position_in_beats > 100:
		spawn_1_beat = 1
		spawn_2_beat = 1
		spawn_3_beat = 1
		spawn_4_beat = 1
	if song_position_in_beats > 225:
		print("song over")
		Global.set_score(score)
		Global.combo = max_combo
		Global.great = great
		Global.good = good
		Global.meh = meh
		Global.missed = missed
		if get_tree().change_scene_to_file("res://Scenes/end_screen.tscn") != OK:
			print("Error changing scenes")


func _spawn_notes(to_spawn):
	if to_spawn > 0:
		lane = randi() % 3 + 1
		instance = note.instantiate()
		instance.initialize(lane)
		add_child(instance)
	else:
		print(song_position_in_beats)

	if to_spawn > 1:
		while true:
			rand = randi() % 3 + 1
			if lane != rand:
				break

		lane = rand
		instance = note.instantiate()
		instance.initialize(lane)
		add_child(instance)

func increment_score(num):
	if num > 0:
		combo += 1
	else:
		combo = 0
	
	if num == 3:
		great += 1
	elif num == 2:
		good += 1
	elif num == 1:
		meh += 1
	else:
		missed += 1
	
	score += num * combo
	$Label.text = str(score)
	if combo > max_combo:
		max_combo  = combo
		
	if combo > 5:
		$ComboText.text = str(combo) + " combo!"
	elif combo > 2:
		$ComboText.text = str(combo) + " combo"
	else:
		$ComboText.text = ""

func reset_combo():
	combo = 0
	$ComboText.text = ""
