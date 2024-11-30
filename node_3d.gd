extends Node3D

var image: Image


func _ready():
	pass
	
func _process(delta):
	if Input.is_action_just_pressed("render"):
		render()
	if Input.is_action_just_pressed("ui_up"):
		save_scene()
		pass
	if Input.is_action_just_pressed("ui_down"):
		load_scene()
		pass
func save_scene():
	print("save")
	pass
	
func load_scene():
	print("load")
	pass
	
func render():
	
	$viewport_grid.visible = false
	await get_tree().create_timer(0.21).timeout
	var texture = get_viewport().get_texture()
	image = texture.get_image()
	var file_dialog = FileDialog.new()
	file_dialog.size = Vector2(50, 400)
	file_dialog.file_selected.connect(_on_save_file_selected)
	file_dialog.access = FileDialog.ACCESS_FILESYSTEM
	file_dialog.file_mode = FileDialog.FILE_MODE_SAVE_FILE
	file_dialog.current_file = "render.png"
	add_child(file_dialog)
	file_dialog.popup_centered()
	var weak_ref = weakref(file_dialog)
	file_dialog.visibility_changed.connect(func(): _on_file_dialog_closed(weak_ref))

func _on_save_file_selected(path):
	image.save_png(path)
	await get_tree().create_timer(0.21).timeout
	get_tree().change_scene_to_file("node_3d.tscn")
	queue_free()

func _on_file_dialog_closed(weak_ref):
	pass


