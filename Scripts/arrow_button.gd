extends AnimatedSprite2D

@export var input = ""

var great = false
var good = false
var meh = false
var current_note = null

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action(input):
		if event.is_action_pressed(input, false):
			if current_note != null:
				if great:
					get_parent().increment_score(3)
					current_note.destroy(3)
				elif good:
					get_parent().increment_score(2)
					current_note.destroy(2)
				elif meh:
					get_parent().increment_score(1)
					current_note.destroy(1)
				_reset()
			else:
				get_parent().increment_score(0)
		if event.is_action_pressed(input):
			frame = 1
		elif event.is_action_released(input):
			frame = 0
			$PushTimer.start()


func _on_great_area_entered(area):
	if area.is_in_group("note"):
		great = true

func _on_great_area_exited(area):
	if area.is_in_group("note"):
		great = false

func _on_good_area_entered(area):
	if area.is_in_group("note"):
		good = true

func _on_good_area_exited(area):
	if area.is_in_group("note"):
		good = false

func _on_meh_area_entered(area):
	if area.is_in_group("note"):
		meh = true
		current_note = area

func _on_meh_area_exited(area):
	if area.is_in_group("note"):
		if current_note == area:
			meh = false
			current_note = null

func _reset():
	current_note = null
	great = false
	good = false
	meh = false
