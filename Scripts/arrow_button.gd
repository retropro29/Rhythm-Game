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
					current_note.destroy(3)
				elif meh:
					get_parent().increment_score(1)
					current_note.destroy(3)
				_reset()
			else:
				get_parent().increment_score(0)
		if event.is_action_pressed(input):
			frame = 1
		elif event.is_action_released(input):
			$PushTimer.start()


#func on_great_area_entered(area):
	#if area.is_in_group("note"):
		#great = true
#
#func on_great_area_exited(area):
	#if area.is_in_group("note"):
		#great = false
#
#func on_good_area_entered(area):
	#if good.is_in_group("note"):
		#great = true
#
#func on_good_area_exited(area):
	#if area.is_in_group("note"):
		#good = false
#
#func on_meh_area_entered(area):
	#if area.is_in_group("note"):
		#meh = true
#
#func on_meh_area_exited(area):
	#if area.is_in_group("note"):
		#meh = false

func _reset():
	current_note = null
	great = false
	good = false
	meh = false
