extends CharacterBody2D

@export var damage:int = 1
@export var speed:int = 700
@export var firebullet:bool = false



func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
	#print("outside screen")
	pass # Replace with function body.


func _on_area_2d_body_entered(body):
	
	if body.is_in_group("enemy"):
		body.damage(damage)
		if not firebullet:
			queue_free()
		pass
	pass # Replace with function body.

func _process(delta):
	velocity.y = -speed
	move_and_slide()
	pass
