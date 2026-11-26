extends CanvasLayer

@onready var animation_player: AnimationPlayer = $Control/Control/AnimationPlayer

func _ready():
	Global.beat.connect(_on_beat)

func _on_beat(position):	
	if position % 2 == 1:
		print("pulse")
		animation_player.play("pulse")
