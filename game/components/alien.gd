extends Enemy



func _ready():
	$ani.play("play")
	pass


func _process(delta):
	_verify(delta)
	pass


func _on_visible_on_screen_notifier_2d_screen_exited():
	get_parent().queue_free()
	pass # Replace with function body.


func _on_on_die():
	var game = Game.get_obj("game")
	var pos = Vector2(
		global_position.x,
		get_parent().global_position.y
	)
	
	game.effect(pos, "explosion")
	game.playKillSound()
	Game.add_score(get_parent().SCORE)
	get_parent().queue_free()
	pass # Replace with function body.


func _on_area_2d_body_entered(body):
	
	if body.is_in_group("player"):
		body.gameover()
		pass
	pass # Replace with function body.
