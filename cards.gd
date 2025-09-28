extends CanvasLayer

@onready var card = $Card1
@onready var mainInfo = $InformationCard1
@onready var background = $Background2
@onready var animation = $AnimationPlayer


func _on_info_button_pressed() -> void:
	background.queue_free()
	mainInfo.queue_free()

func _ready() -> void:
	mainInfo.modulate = Color(0.0, 0.0, 0.0, 0.0)
	animation.play("cardAnimation")

func _on_main_card_pressed() -> void:
	card.queue_free()
	animation.play("Information")
