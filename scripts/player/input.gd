extends CharacterBody3D
class_name Player_Input

@export var settings: Resource
@onready var camera = $Player/Head/Camera

func _input(event):
	if event is InputEventMouseMotion:
		HandleLook(event)
	
func HandleLook(event):
	settings.ply_look_x += -event.relative.x * settings.ply_look_speed_x
	settings.ply_look_y += -event.relative.y * settings.ply_look_speed_y
	
	settings.ply_look_x = clamp(settings.ply_look_x, settings.ply_max_look_angle_down, settings.ply_max_look_angle_up)

func HandleViewAngles(delta):
	camera.rotation_degrees.x = settings.ply_look_x
	camera.rotation_degrees.y = settings.ply_look_y
	
func HandleInput():
	settings.ply_move_side += int(settings.ply_speed_side) * (int(Input.get_action_strength("player_l") * 50))
	settings.ply_move_side -= int(settings.ply_speed_side) * (int(Input.get_action_strength("player_r") * 50))
	
	settings.ply_move_forward += int(settings.ply_speed_forward) * (int(Input.get_action_strength("player_f") * 50))
	settings.ply_move_forward -= int(settings.ply_speed_back) * (int(Input.get_action_strength("player_b") * 50))
	
	# Make some clamps.
	if Input.is_action_just_released("player_l") or Input.is_action_just_released("player_r"):
		settings.ply_move_side = 0
	else:
		settings.ply_move_side = clamp(settings.ply_move_side, -4096, 4096)
		
	if Input.is_action_just_released("player_f") or Input.is_action_just_released("player_b"):
		settings.ply_move_up = 0
		settings.ply_move_forward = 0
	else:
		settings.ply_move_up = clamp(settings.ply_move_up, -4096, 4096)
		settings.ply_move_forward = clamp(settings.ply_move_forward, -4096, 4096)
