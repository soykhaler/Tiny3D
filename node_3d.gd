extends Node3D

var image: Image


func _ready():
	pass
	
func _process(delta):
	if Input.is_action_just_pressed("render"):
		render()
	if Input.is_action_just_pressed("save"):
		save_scene()
		pass
	if Input.is_action_just_pressed("load"):
		load_scene()
		pass

func save_scene():
	var packed_scene = PackedScene.new()
	var current_scene = get_tree().get_current_scene()  # Obtén la escena actual, incluyendo los nuevos nodos
	var result = packed_scene.pack(current_scene)
	if result == OK:
		var save_path = "res://saved_scene.tscn"
		var error = ResourceSaver.save(packed_scene, save_path)
		if error != OK:
			print("Error al guardar la escena.")
		else:
			print("Escena guardada en: ", save_path)
	else:
		print("Error al empaquetar la escena.")
	
func load_scene_legacy():
	var load_path = "res://saved_scene.tscn"
	if ResourceLoader.exists(load_path):
		var error = get_tree().change_scene_to_file(load_path)
		if error != OK:
			print("Error al cambiar a la escena guardada: ", error)
	else:
		print("El archivo de escena existe.")
		
func load_scene():
	# Crear un diálogo de archivo para seleccionar la escena
	var file_dialog = FileDialog.new()
	file_dialog.size = Vector2(800, 600)  # Tamaño más grande para mejor visibilidad
	file_dialog.file_selected.connect(_on_load_file_selected)
	file_dialog.access = FileDialog.ACCESS_FILESYSTEM
	file_dialog.file_mode = FileDialog.FILE_MODE_OPEN_FILE
	file_dialog.add_filter("*.tscn ; Escenas de Godot")
	add_child(file_dialog)
	file_dialog.popup_centered()
	file_dialog.visibility_changed.connect(func(): _on_file_dialog_closed2(weakref(file_dialog)))

func _on_load_file_selected(path):
	if ResourceLoader.exists(path):
		var error = get_tree().change_scene_to_file(path)
		if error != OK:
			print("Error al cambiar a la escena: ", error)
	else:
		print("El archivo de escena no existe en la ruta: ", path)

func _on_file_dialog_closed2(weak_ref):
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
	$viewport_grid.visible = true


func _on_file_dialog_closed(weak_ref):
	$viewport_grid.visible = true
	pass


