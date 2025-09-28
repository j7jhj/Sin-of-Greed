extends Sprite2D

@onready var mainInfo = $"."
@onready var background = $"../Background2"
@onready var card = $"../Card1"

func _on_info_button_pressed() -> void:
	card.modulate = Color(0.0, 0.0, 0.0, 0.0)
	background.modulate = Color(0.0, 0.0, 0.0, 0.0)
	mainInfo = Color(0.0, 0.0, 0.0, 0.0)
	
	background.visible = false
