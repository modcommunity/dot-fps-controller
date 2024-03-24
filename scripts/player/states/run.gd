extends Resource

var ply: Player

func activate(data = {}):
	print("[STATE_RUN] Activated!")
	
func deactivate(data = {}):
	pass

func _physics_process(delta):
	print("[STATE_RUN] physics process!")
	
	if ply.on_floor:
		floor_move(delta)
	else:
		# Swap to air state.
		ply.state.swap_state("run", "air")
		
	# Check for jump.
	if Input.is_action_just_pressed("player_jump") && not ply.is_crouched && ply.should_jump:
		check_jump()
		
		ply.on_floor = false
		ply.state.swap_state("run", "jump", {}, { do_jump = true })
	
	ply.VelocityCheck()
	
func floor_move(delta):
	var forward = Vector3.FORWARD
	var side = Vector3.LEFT
	
	forward = forward.rotated(Vector3.UP, ply.camera.rotation.y)
	side = side.rotated(Vector3.UP, ply.camera.rotation.y)
	
	forward = forward.normalized()
	side = side.normalized()
	
	var f_move = ply.move_forward
	var s_move = ply.move_side
	
	var wish_vel = forward * f_move * side * s_move
	
	friction(delta)
	
	wish_vel.y = 0
	
	var wish_dir = wish_vel.normalized()
	
	var wish_speed = wish_vel.length()
	
	# Clamp.
	if wish_speed != 0 and wish_speed > ply.speed:
		wish_vel *= ply.speed / wish_speed
		wish_speed = ply.speed

	accelerate(wish_dir, wish_speed, ply.settings.accelerate, delta)
	
func friction(delta):
	var speed = ply.vel.length()
	
	if speed < 0:
		return
	
	var fric = ply.settings.friction
	
	var control = ply.settings.stop_speed if speed < ply.settings.stop_speed else speed
	
	var drop = control * fric * delta
	
	var new_speed = speed - drop
	
	if new_speed < 0:
		return
		
	if new_speed != speed:
		new_speed /= speed
		
		ply.vel *= new_speed
	
func accelerate(wish_dir, wish_speed, accel, delta):
	var cur_speed = ply.vel.dot(wish_dir)
	
	var add_speed = wish_speed - cur_speed
	
	if add_speed <= 0:
		return
		
	var accel_speed = accel * wish_speed * delta
	
	for i in range(3):
		ply.vel += accel_speed * wish_dir

func check_jump():
	ply.snap = Vector3.ZERO
	
	if not ply.should_jump or ply.velocity.y > 15:
		return
		
	var groundFactor = 1.0
	
	var mul : float
	
	if ply.is_crouching:
		mul = sqrt(2 * (ply.settings.gravity * 1.1) * ply.settings.jump_height)
		
		ply.move_and_collide(Vector3(0, 2 - ply.collision.scale.y, 0))
	else:
		mul = sqrt(2 * ply.settings.gravity * ply.settings.jump_height)
		
	var jump_vel = groundFactor * mul + max(0, ply.vel.y)
	
	ply.vel.y = max(jump_vel, jump_vel + ply.vel.y)
	
func _process(delta):
	pass
