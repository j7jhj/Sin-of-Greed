extends TextureRect

@onready var animationPlayer = $"../AnimationPlayer"

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("Menu"):
		animationPlayer.play("Open")
	pass
