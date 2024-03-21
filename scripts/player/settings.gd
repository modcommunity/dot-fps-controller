extends Resource
class_name Player_Settings

@export_category("General Settings")
@export var ply_mouse_sensitivity = 1.5
@export var ply_max_look_angle_down = -90
@export var ply_max_look_angle_up = 90
@export var ply_max_slope_angle = deg_to_rad(45)

@export_category("Feature Settings")
@export var ply_can_noclip = false
@export var ply_can_crouch = true
@export var ply_can_sprint = true
@export var ply_can_walk = true
@export var ply_can_auto_hop = false

@export_category("Movement Settings")
@export var ply_look_speed_y = 0.3
@export var ply_look_speed_x = 0.3

@export var ply_speed_side = 20
@export var ply_speed_forward = 20
@export var ply_speed_up = 20
@export var ply_speed_back = 20

@export var ply_accelerate = 7
@export var ply_max_accelerate = 150
@export var ply_max_air_speed = 1
@export var ply_friction = 3
@export var ply_stop_speed = 50
@export var ply_gravity = 60
@export var ply_max_velocity = 40000

@export var ply_jump_height = 4
@export var ply_step_size = 8

@export var ply_max_speed = 20
@export var ply_base_speed = 14
@export var ply_crouch_speed = 10
@export var ply_sprint_speed = 18
@export var ply_walk_speed = 12

@export_category("Other")
@export var vel = Vector3.ZERO
@export var snap = Vector3.DOWN

@export var ply_noclip = false
@export var ply_crouching : bool
@export var ply_crouched : bool
@export var ply_sprinting : bool
@export var ply_can_jump : bool
@export var ply_was_on_floor = false
@export var ply_on_floor = false
@export var ply_should_jump = false

@export var ply_move_side : float
@export var ply_move_up : float
@export var ply_move_forward : float
@export var ply_look_y : float
@export var ply_look_x : float

@export var cam_path : NodePath

var speed = ply_max_speed
