extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
	
func _erase():
	%Slider.queue_free()
	%Label.queue_free()
	%Button.queue_free()
	%ColorPicker.queue_free()
	%ColorRect.queue_free()
	%Label2.queue_free()
	

func _on_button_pressed():
	%Light.light_color =  %ColorPicker.color 
	%Light.light_energy = %Slider.value  
	_erase()
	pass # Replace with function body.


func _on_slider_value_changed(value):
	%Label2.text = str(%Slider.value)
	pass # Replace with function body.
