extends Camera3D

var scroll_speed = 1.0
@export var speed = 10.0  
@export var mouse_sensitivity = 0.2 

var dragging = false

func _unhandled_input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_RIGHT:
			dragging = event.pressed
			if dragging:
				Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
			else:
				Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		
		if event.button_index == MOUSE_BUTTON_WHEEL_UP:
			fov -=1

		elif event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
			fov +=1

	
	if event is InputEventMouseMotion and dragging:
		# Rotación horizontal
		rotate_y(deg_to_rad(-event.relative.x * mouse_sensitivity))
		# Rotación vertical
		rotation.x += deg_to_rad(-event.relative.y * mouse_sensitivity)
		# Limitar la rotación vertical
		rotation.x = clamp(rotation.x, deg_to_rad(-90), deg_to_rad(90))

func _process(delta):
	if dragging:
		# Movimiento WASD
		var input_dir = Input.get_vector("move_left", "move_right", "move_forward", "move_back")
		var direction = (global_transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
		global_translate(direction * speed * delta)

		# Movimiento vertical

		if Input.is_action_pressed("up"):
			position.y += 0.15
		if Input.is_action_pressed("down"):
			position.y -= 0.15
