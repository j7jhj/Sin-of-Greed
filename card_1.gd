extends Sprite2D


@onready var card = $"."
@onready var infoCard = $"../InformationCard1"
@onready var animation = $"../AnimationPlayer"

func _ready() -> void:
	infoCard.modulate = Color(0.0, 0.0, 0.0, 0.0)
	animation.play("cardAnimation")

func _on_main_card_pressed() -> void:
	card.modulate = Color(0.0, 0.0, 0.0, 0.0)
	animation.play("Information")
