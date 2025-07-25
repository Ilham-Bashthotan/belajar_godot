class_name GameInputEvents

static func movement_input() -> Vector2:
	var direction: Vector2 = Vector2.ZERO
	
	if Input.is_action_pressed("walk_up"):
		direction = Vector2.UP
	elif Input.is_action_pressed("walk_down"):
		direction = Vector2.DOWN
	elif Input.is_action_pressed("walk_left"):
		direction = Vector2.LEFT
	elif Input.is_action_pressed("walk_right"):
		direction = Vector2.RIGHT
	
	return direction

static func is_moving() -> bool:
	return movement_input() != Vector2.ZERO

static func use_tool() -> bool:
	return Input.is_action_just_pressed("hit")
