extends Sprite2D

@onready var animationPlayer = $"../AnimationPlayer"
@onready var sprite = $"."

@onready var negative1 = $Negative1
@onready var negative2 = $Negative2
@onready var negative3 = $Negative3

func _ready() -> void:
	checkRestart()

func checkRestart():
	while not Calamity.restart:
		print("You're alive! Or in limbo or smth lmao")
		await get_tree().create_timer(0.1).timeout
	
	if Calamity.restart:
		print('Menu Restarted!')
		
		negative1.modulate = Color(1.0, 1.0, 1.0, 0.0)
		negative2.modulate = Color(1.0, 1.0, 1.0, 0.0)
		negative3.modulate = Color(1.0, 1.0, 1.0, 0.0)
		
		Calamity.restart = false
	checkRestart()

func _process(delta: float) -> void:
	if not Input.is_action_pressed("Menu"):
		return
	if not Input.is_action_pressed("Menu"):
		return
	animationPlayer.play("Menu")
	if Input.is_action_pressed("Menu"):
		animationPlayer.play("Menu")
		
	animationPlayer.play("CloseMenu")
	
	if Calamity.desperationBool == true:
		negative1.modulate = Color(1.0, 1.0, 1.0, 1)
		negative2.modulate = Color(1.0, 1.0, 1.0, 1)
		negative3.modulate = Color(1.0, 1.0, 1.0, 1)


		
