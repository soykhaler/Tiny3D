extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	%Label3D.text = $TextEdit.text 
	
	await get_tree().create_timer(0.21).timeout
	queue_free()
	pass # Replace with function body.
