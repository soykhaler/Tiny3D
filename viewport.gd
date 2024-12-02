extends Area3D

var camera: Camera3D
var dragging = false
var selected_mesh = false
var entered = false


func _ready():
	$Sphere.visible = false
	selected_mesh = false
	# Asegúrate de ajustar la ruta a tu cámara según la estructura de tu escena.
	camera = get_viewport().get_camera_3d()
	camera = get_node("/root/Node3D/Camera3D")
	if not camera:
		print("No se encontró la cámara")
		camera = get_node("/root/Node3D2/Camera3D")

func _process(delta):
	if Input.is_action_just_pressed("delete_button"):
		if entered == true:
			queue_free()

func _unhandled_input(event):
	if event is InputEventMouseButton:
		if (event.button_index == MOUSE_BUTTON_LEFT and selected_mesh == true):
			dragging = event.pressed;
	elif event is InputEventMouseMotion and dragging:
		_move_object(event)

func _move_object(event: InputEventMouseMotion):
	# Calcula la dirección del rayo desde la cámara hacia donde está apuntando el ratón.
	var from = camera.project_ray_origin(event.position)
	var to = from + camera.project_ray_normal(event.position) * 1000  # Distancia arbitraria, ajusta según tu escena
	
	# Aquí asumo que el cubo se mueve en un plano horizontal (Y=0), ajusta según necesites.
	var plane = Plane(Vector3.UP, 0)
	var intersection = plane.intersects_ray(from, to)
	
	if intersection:
		global_transform.origin = intersection
		

func _on_mouse_entered():
	selected_mesh= true 
	$Sphere.visible = true
	entered = true
	


func _on_mouse_exited():
	selected_mesh = false
	$Sphere.visible = false
	entered = false
