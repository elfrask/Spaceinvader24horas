extends CharacterBody2D
class_name Enemy

signal on_die

@export var health: int = 1
@export var atk: int = 1
var vida:int = health
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func damage(hit = 1):
	vida -= hit
	print("daño")
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _verify(delta):
	#print("verifica")
	
	if vida < 1:
		emit_signal("on_die")
		#print("murio")
	pass
