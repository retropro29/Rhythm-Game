extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Grade.text = Global.grade
	$Score.text = str(Global.score)
	$Combo.text = str(Global.combo)
	$Great.text = str(Global.great)
	$Good.text = str(Global.good)
	$Meh.text = str(Global.meh)
	$Missed.text = str(Global.missed)
