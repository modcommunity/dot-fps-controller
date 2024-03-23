extends Resource
class_name Player_Input

var ply: Player = null

func HandleLook(event):
	if not ply or not ply.settings:
		return
		
	ply.look_x += -event.relative.y * ply.settings.look_speed_x
	ply.look_y += -event.relative.x * ply.settings.look_speed_y
	
	ply.look_x = clamp(ply.look_x, ply.settings.max_look_angle_down, ply.settings.max_look_angle_up)

func HandleViewAngles(delta):
	if not ply or not ply.settings:
		return
		
	ply.camera.rotation_degrees.x = ply.look_x
	ply.camera.rotation_degrees.y = ply.look_y
	
func HandleKeys():
	if not ply or not ply.settings:
		return
		
	ply.move_side += int(ply.settings.speed_side) * (int(Input.get_action_strength("player_l") * 50))
	ply.move_side -= int(ply.settings.speed_side) * (int(Input.get_action_strength("player_r") * 50))
	
	ply.move_forward += int(ply.settings.speed_forward) * (int(Input.get_action_strength("player_f") * 50))
	ply.move_forward -= int(ply.settings.speed_back) * (int(Input.get_action_strength("player_b") * 50))
	
	# Make some clamps.
	if Input.is_action_just_released("player_l") or Input.is_action_just_released("player_r"):
		ply.move_side = 0
	else:
		ply.move_side = clamp(ply.move_side, -4096, 4096)
		
	if Input.is_action_just_released("player_f") or Input.is_action_just_released("player_b"):
		ply.move_up = 0
		ply.move_forward = 0
	else:
		ply.move_up = clamp(ply.move_up, -4096, 4096)
		ply.move_forward = clamp(ply.move_forward, -4096, 4096)
