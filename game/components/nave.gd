extends CharacterBody2D


@onready var longpage = get_viewport().size.x
var marge = 50

@export var arms_counts: int= 1

var vida = 3

var BULLET = preload("res://components/bullet.tscn")

@onready var Shoots = [
	$r, $c, $l
]


func _ready():
	
	
	pass

func gameover():
	var game = Game.get_obj("game")
	
	vida -=1
	
	game.showhealt(vida)
	
	if vida < 1:
		game.effect(global_position, "explosion")
		game.gameover()
		queue_free()
	else:
		$AnimationPlayer.play("hit")
		$hit.play()
	#print("EFE")
	pass

func _process(delta):
	
	game(delta)
	
	
func game(delta):
	
	
	if Input.is_action_pressed("press"):
		position.x = clamp(get_viewport().get_mouse_position().x, marge, longpage - marge)
		pass
	pass

func shoot(damage: int, pos: Vector2):
	
	var parent = get_parent()
	
	var bala:CharacterBody2D = BULLET.instantiate()
	parent.call_deferred("add_child", bala)
	
	bala.position = pos
	
	#print("disparo")
	
	pass

func autoshoot(damage, shoots = 1):
	if shoots > 3: shoots = 3
	$laser.play()
	match shoots:
		1:
			shoot(damage, $c.global_position)
			pass
		2:
			shoot(damage, $l.global_position)
			shoot(damage, $r.global_position)
			pass
		3:
			shoot(damage, $c.global_position)
			shoot(damage, $l.global_position)
			shoot(damage, $r.global_position)
			pass
		
	pass

func _on_timer_timeout():
	
	autoshoot(1, arms_counts)
	
	pass # Replace with function body.
