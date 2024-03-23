extends CharacterBody3D
class_name Player

var settings: Player_Settings
var input: Player_Input 

@onready var head = $Head
@onready var camera = $Head/Camera

@export_category("State")
@export var vel = Vector3.ZERO
@export var snap = Vector3.DOWN

@export var is_noclip = false
@export var is_crouching : bool
@export var is_crouched : bool
@export var is_sprinting : bool
@export var can_jump : bool
@export var was_on_floor = false
@export var on_floor = false
@export var should_jump = false

@export var move_side : float
@export var move_up : float
@export var move_forward : float
@export var look_y : float
@export var look_x : float

var speed = 0

func _ready():
	# Load our settings class.
	settings = load("res://scripts/player/settings.gd").new()
	
	# Load our input class + assign ply to self.
	input = load("res://scripts/player/input.gd").new()
	input.ply = self
	
	if settings:
		speed = settings.max_speed
	
func _input(event):
	if event is InputEventMouseMotion:
		input.HandleLook(event)
		
func _process(delta):
	# Clamp field of view.
	camera.fov = clamp(70 + sqrt(vel.length() * 7), 90, 180)
	
	# Handle view angles.
	input.HandleViewAngles(delta)
	
	# Handle input keys.
	input.HandleKeys()
	
	# Set snap.
	snap = -get_floor_normal()
	
	# Tell us if we were on the floor or not.
	was_on_floor = on_floor
	
	# Set velocity.
	velocity = vel
	move_and_slide_collide()
	vel = velocity
	
	if (on_floor):
		should_jump = true

func move_and_slide_collide() -> bool:
	var collision := false
	
	on_floor = false
	
	# Check floor.
	var checkMot := velocity * (1/60.)
	checkMot.y -= settings.gravity * (1/360.)
	
	var testCol := move_and_collide(checkMot, true)
	
	if testCol:
		var testNorm = testCol.get_normal()
		
		if testNorm.angle_to(up_direction) < settings.max_slope_angle:
			on_floor = true
			
	var motion := velocity * get_delta_time()
	
	for step in max_slides:
		var col := move_and_collide(motion)
		
		if not col:
			break
			
		var norm = col.get_normal()
		
		motion = col.get_remainder().slide(norm)
		velocity = velocity.slide(norm)
		
		collision = true
		
	return collision
	
func get_delta_time() -> float:
	if Engine.is_in_physics_frame():
		return get_physics_process_delta_time()
		
	return get_process_delta_time()
	

func _physics_process(delta):
	pass
