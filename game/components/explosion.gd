extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$CPUParticles2D.emitting = true
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_cpu_particles_2d_finished():
	queue_free()
	pass # Replace with function body.
