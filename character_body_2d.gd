extends CharacterBody2D

var jumpVelocity = -300.0
var doubleJump = 0

@onready var character = $AnimatedSprite2D
@onready var animation = $PlayerAnimation
@onready var calamityEffect = $AnimatedSprite2D2
@onready var camera = $Camera2D

func _ready() -> void:
	calamityDeath()
	checkRestart()

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta

	if Input.is_action_just_pressed("Jump") and is_on_floor():
		character.play("Jump")
		velocity.y = jumpVelocity
		doubleJump = 1
	
	if Input.is_action_just_pressed("Jump") and not is_on_floor():
		if doubleJump == 1:
			character.play("Jump")
			print(doubleJump)
			velocity.y = jumpVelocity * 0.75
			doubleJump = 0 
	if velocity.x == 0 and velocity.y == 0:
		character.play("Idle")

	var mainDirection = Input.get_axis("Left", "Right")
	if mainDirection:
		character.flip_h = true
		character.play("Walk")
		velocity.x = mainDirection * Calamity.speed
		
		if mainDirection > 0:
			character.flip_h = false
		if mainDirection < 0:
			character.flip_h = true
	
	else:
		velocity.x = move_toward(velocity.x, 0, Calamity.speed)
	move_and_slide()
	
func checkRestart():
	while not Calamity.restart:
		print("You're alive! Or in limbo or smth lmao")
		await get_tree().create_timer(0.1).timeout
	
	if Calamity.restart:
		print('Character Restarted!')
		Calamity.restart = false
		jumpVelocity = -300
		
		Calamity.speed = 100
		camera.zoom = Vector2(3,3)
		
	checkRestart()
	calamityDeath()
		
func calamityDeath():
	while not Calamity.died:
		print("Not dead.. Yet")
		await get_tree().create_timer(0.1).timeout
	
	if Calamity.died:
		animation.play("Camera")
		jumpVelocity = 0
		Calamity.speed = 0
		print("Calamity is dead!")

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "Camera":
		camera.zoom = Vector2(7,7)
		
		calamityEffect.play("default")
		
		animation.play("Fadeout")
