extends CanvasLayer

func _on_texture_button_pressed() -> void:
	Calamity.restart = true
	print("Button pressed")
