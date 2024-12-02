extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	_hide_buttons()
	pass # Replace with function body.

func show_buttons():
	$Button.visible = true
	$Button2.visible = true
	$Button3.visible = true
	$Button4.visible = true
	$Button5.visible = true
	$Button6.visible = true



func _process(delta):
	if Input.is_action_just_pressed("tab"):
		$Button.position = get_viewport().get_mouse_position()
		$Button2.position = get_viewport().get_mouse_position()
		$Button3.position = get_viewport().get_mouse_position()
		$Button4.position = get_viewport().get_mouse_position()
		$Button5.position = get_viewport().get_mouse_position()
		$Button6.position = get_viewport().get_mouse_position()
		$Button2.position.y +=50
		$Button3.position.y +=100
		$Button4.position.y += 150
		$Button5.position.y += 200
		$Button6.position.y +=250
		show_buttons()
	pass


func _hide_buttons():
	$Button.visible = false
	$Button2.visible = false
	$Button3.visible = false
	$Button4.visible = false
	$Button5.visible = false
	$Button6.visible = false

func _on_button_pressed():
	var cube_mesh_scene = preload("res://cube_mesh.tscn")
	var cube_instance = cube_mesh_scene.instantiate()
	add_child(cube_instance)
	cube_instance.owner = get_tree().get_current_scene()
	_hide_buttons()

func _on_button_2_pressed():
	var sphere_mesh_scene = preload("res://sphere_mesh.tscn")
	var sphere_instance = sphere_mesh_scene.instantiate()
	add_child(sphere_instance)
	sphere_instance.owner = get_tree().get_current_scene()
	_hide_buttons()

func _on_button_3_pressed():
	var plane_mesh_scene = preload("res://plane_mesh.tscn")
	var plane_instance = plane_mesh_scene.instantiate()
	add_child(plane_instance)
	plane_instance.owner = get_tree().get_current_scene()
	_hide_buttons()
	pass # Replace with function body.


func _on_button_4_pressed():
	var text_mesh_scene = preload("res://text_mesh.tscn")
	var text_instance = text_mesh_scene.instantiate()
	add_child(text_instance)
	text_instance.owner = get_tree().get_current_scene()
	_hide_buttons()
	pass # Replace with function body.



func _on_button_5_pressed():
	var light_mesh_scene = preload("res://light_mesh.tscn")
	var light_instance = light_mesh_scene.instantiate()
	add_child(light_instance)
	light_instance.owner = get_tree().get_current_scene()
	_hide_buttons()
	pass # Replace with function body.


func _on_button_6_pressed():
	var sky_scene = preload("res://light_scene.tscn")
	var sky_instance = sky_scene.instantiate()
	%WorldEnvironment.queue_free()
	add_child(sky_instance)
	sky_instance.owner = get_tree().get_current_scene()
	_hide_buttons()
	pass # Replace with function body.
