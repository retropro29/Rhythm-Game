extends Node2D

signal beat(position)
signal measure(position)

var score = 0
var combo = 0
var great = 0
var good = 0
var meh = 0
var missed = 0
var grade = "NA"

func set_score(new):
	score = new
	if good + meh + missed == 0:
		grade = "SS"
	elif score > 200000:
		grade = "S"
	elif score > 150000:
		grade = "A"
	elif score > 100000:
		grade = "B"
	elif score > 70000:
		grade = "C"
	elif score > 30000:
		grade = "D"
	else:
		grade = "F"
