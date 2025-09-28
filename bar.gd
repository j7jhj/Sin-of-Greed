@tool 
class_name MyResource

extends TextureRect

@onready var bar = $"."
@onready var label = $"../BarOutline/Label"
@onready var desperationTempo = $"../DesperationPlayer"

var value = 10
var value_displayed = value
var timeout = 0
var finished = false

func _ready() -> void:
	calamityMeter()
	check()
	checkRestart()
	print(Calamity.changed)
	scale.x = 0.4

func checkRestart():
	while not Calamity.restart:
		print("You're alive! Or in limbo or smth lmao")
		await get_tree().create_timer(0.1).timeout
	
	if Calamity.restart:
		print('Bar Repeated!')
		value = 10
		value_displayed = value
		timeout = 0
		finished = false
		
		scale.x = 0.4
		desperationTempo.stop()
		
		Calamity.restart = false

	checkRestart()
	check()
	calamityMeter()

func check():
	while true:
		if Calamity.changed == true and scale.x <= 3.05 and value < 100 and (Calamity.calamityInt) <= 100:
			if finished == false:
				scale.x += (scale.x / 100) * Calamity.calamityInt 

				value_displayed += Calamity.calamityInt
				Calamity.calamityInt = 0
						
				label.text = "  " + str((value_displayed)) + " CY"
				
				print(Calamity.changed)
				Calamity.changed = false
				
				if scale.x >= 2.56:
					desperationTempo.play("desperation")
					Calamity.speed += 30
				
					Calamity.desperationBool = true
			
				if scale.x > 3.05:
					scale.x = 3.05
					finished = true
					
					Calamity.died = true
				
				continue
				
		await get_tree().create_timer(0.01).timeout

func calamityMeter() -> void:
	while scale.x <= 3.05 and value < 100 and (Calamity.calamityInt) <= 100:	
		if	finished == false:
			print("Activated!")
			print((Calamity.changed))
		 	
			scale.x += (scale.x / 100)
			value_displayed += 1
			
			label.text = "  " + str(value_displayed) + " CY"
			
			if scale.x >= 2.56:
				desperationTempo.play("desperation")
				Calamity.speed += 30
				
				Calamity.desperationBool = true
			
			if scale.x > 3.05:
				scale.x = 3.05
				finished = true
				
				Calamity.died = true
			
		await get_tree().create_timer(2).timeout
	pass
		
