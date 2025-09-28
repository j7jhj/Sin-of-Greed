extends Node

var calamityInt = 0
var oldCalamity = 0
var restart = false

var died = false

var changed = false

var speed = 100
var desperationBool = false

var crate = "$Crateh"

func _ready() -> void:	
	oldCalamity = calamityInt 
	infiniteCheck()
	print(oldCalamity)
	pass
	
func infiniteCheck():
	while true:	
		if calamityInt > oldCalamity:
			changed = true
		else:
			print("No calamity")
		oldCalamity = calamityInt 
		
		await get_tree().create_timer(0.1).timeout
	pass
	
	
	
