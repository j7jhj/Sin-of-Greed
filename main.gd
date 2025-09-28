extends Node2D

@onready var crate = $Crate
@onready var plank = $Plank
@onready var table = $Table
@onready var supporter = $Supporter
@onready var menu = $SpawnMenu/Sprite2D
@onready var animationPlayer = $SpawnMenu/AnimationPlayer
@onready var playerAnimation = $Node2D/Player/PlayerAnimation
@onready var deathAnimation = $Death/AnimationPlayer
@onready var deathRect = $Death/ColorRect
@onready var playerNode = $Node2D
@onready var theEnd = $TheEnd
@onready var CrystalPlayer = $Ending/AnimationPlayer
@onready var Crystallabel = $Ending/Label
@onready var CrystalRect = $Ending/ColorRect
@onready var CrystalCity = $Ending/Gpp4LvOWcAaUnxm

var maxAmount = 1

var main = {
	"crate": false,
	"plank": false,
	"table": false,
	"supporter": false,
}
func _ready() -> void:
	theEnd.play()
	pass

func _on_crate_button_pressed() -> void:
	if main['crate'] == false:
		main['crate'] = true
		menu.visible = false
		print("Pressed")
func _on_plank_button_pressed() -> void:
	if main['plank'] == false:
		main['plank'] = true
		menu.visible = false
		print("Pressed")
		
func _on_table_button_pressed() -> void:
	if main['table'] == false:
		main['table'] = true
		menu.visible = false
		print("Pressed")
		
func _on_supporter_button_pressed() -> void:
	if main['supporter'] == false:
		main['supporter'] = true
		menu.visible = false
		print("Pressed")

func _physics_process(_delta: float) -> void:
	if Input.is_action_just_pressed("MouseLeft"): 
		var mousePosition = get_viewport().get_camera_2d().get_global_mouse_position()
		
		for key in main:
			if main[key] and key == "crate":
				var clone = crate.duplicate()
				clone.global_position = mousePosition

				get_parent().add_child(clone)
				print("Crate spawned!")
				
				clone.add_to_group("Parts")

				main[key] = false
				menu.visible = true
				
				if Calamity.desperationBool == true:
					Calamity.calamityInt += 30
				else:
					(Calamity.calamityInt) += 30
				
			if main[key] and key == "plank":
				var clone = plank.duplicate()
				clone.global_position = mousePosition

				get_parent().add_child(clone)
				print("plank spawned!")
				
				clone.add_to_group("Parts")

				main[key] = false
				menu.visible = true
				
				if Calamity.desperationBool == true:
					Calamity.calamityInt += 1
				else:
					(Calamity.calamityInt) += 1
				
			if main[key] and key == "table":
				var clone = table.duplicate()
				clone.global_position = mousePosition

				get_parent().add_child(clone)
				print("table spawned!")
				
				clone.add_to_group("Parts")

				main[key] = false
				menu.visible = true
				
				if Calamity.desperationBool == true:
					Calamity.calamityInt += 1
				else:
					(Calamity.calamityInt) += 2
				
			if main[key] and key == "supporter":
				var clone = supporter.duplicate()
				clone.global_position = mousePosition

				get_parent().add_child(clone)
				print("supporter spawned!")
				
				clone.add_to_group("Parts")

				main[key] = false
				menu.visible = true
				
				if Calamity.desperationBool == true:
					Calamity.calamityInt += 2
				else:
					(Calamity.calamityInt) += 3

func _on_area_2d_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if body.is_in_group("player"):
		Crystallabel.modulate = Color(1.0, 1.0, 1.0, 1.0)
		CrystalRect.modulate = Color(1.0, 1.0, 1.0, 1.0)
		
		CrystalPlayer.play("Ending")
		CrystalPlayer.play("ScrollingEffect")
	pass 

func _on_player_animation_animation_finished(anim_name: StringName) -> void:
	if anim_name == "Camera":
		deathRect.modulate = Color(0.0, 0.0, 0.0, 0.0)
		deathRect.position = Vector2(-622.0, -355.0)
		deathAnimation.play("Death")


func _on_texture_button_pressed() -> void:
	Calamity.calamityInt = 0
	Calamity.oldCalamity = 0
	Calamity.restart = false

	Calamity.died = false

	Calamity.changed = false

	Calamity.speed = 100
	Calamity.desperationBool = false
	
	for node in get_tree().get_nodes_in_group("Parts"):	
		if node: 
			node.queue_free()
	
	get_tree().reload_current_scene()
	
	
