extends Node

@onready var fps_label = $UI/Container/Port/FPS
@onready var speed_label = $UI/Container/Port/Speed

@onready var ply = $Player

func _ready():
	pass

func _process(delta):
	# Update FPS label.
	if fps_label:
		var fps = Engine.get_frames_per_second()
		
		fps_label.text = "FPS: %s" % fps
		
	if speed_label and ply:
		speed_label.text = "Speed: %s" % ply.cur_speed
		
