extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	$ColorRect/points.text = str(Game.BestScore)
	$bg.emitting =true
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_start_pressed():
	
	get_tree().change_scene_to_file("res://components/game.tscn")
	pass # Replace with function body.
