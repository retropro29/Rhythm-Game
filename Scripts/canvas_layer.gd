extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("Score: ", Global.score)
	print("Combo: ", Global.combo)
	print("Great: ", Global.great)
	print("Good: ", Global.good)
	print("Meh: ", Global.meh)
	print("Missed: ", Global.missed)
	
	$Grade.text = Global.grade
	$Score.text = "Score: " + str(Global.score)
	$Combo.text = "Combo: " + str(Global.combo)
	$Great.text = "Great: " +str(Global.great)
	$Good.text = "Good: " +str(Global.good)
	$Meh.text = "Meh: " +str(Global.meh)
	$Missed.text = "Missed: " +str(Global.missed)
