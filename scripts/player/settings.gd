extends Node
class_name Player_Settings

@export_category("General Settings")
@export var mouse_sensitivity = 1.5
@export var max_look_angle_down = -90
@export var max_look_angle_up = 90
@export var max_slope_angle = deg_to_rad(45)
@export var verbose = 0

@export_category("Feature Settings")
@export var can_noclip = false
@export var can_crouch = true
@export var can_sprint = true
@export var can_walk = true
@export var can_auto_hop = false

@export_category("Movement Settings")
@export var look_speed_y = 0.3
@export var look_speed_x = 0.3

@export var speed_side = 20
@export var speed_forward = 20
@export var speed_up = 20
@export var speed_back = 20

@export var accelerate = 3
@export var air_accelerate = 150
@export var max_accelerate = 7
@export var max_air_speed = 1
@export var friction = 3
@export var stop_speed = 10
@export var gravity = 30
@export var max_velocity = 40000

@export var jump_height = 1
@export var step_size = 8

@export var max_speed = 5
@export var base_speed = 14
@export var crouch_speed = 10
@export var sprint_speed = 18
@export var walk_speed = 12
