extends Node2D

@export var health: int = 1
@export var atk: int = 1
@export var SCORE: int = 10
# Called when the node enters the scene tree for the first time.
func _ready():
	$alien.health = health
	$alien.atk = atk
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
