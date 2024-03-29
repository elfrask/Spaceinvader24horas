extends Node2D

var EffectList = {
	"explosion": preload("res://components/explosion.tscn")
}


func effect(pos: Vector2, effectType: String):
	print("Efecto")
	var efecto:PackedScene = EffectList.get(effectType, EffectList["explosion"])
	
	var instancia = efecto.instantiate()
	call_deferred("add_child", instancia)
	
	instancia.global_position = pos
	
	pass


enum ENEMYES {
	ALIEN
}

@onready var longpage = get_viewport().size.x

const ALIEN = preload("res://components/alien.tscn")

@onready var vidas = [
	$"healts/1", $"healts/2", $"healts/3"
] 


func showhealt(vida):
	vida = clamp(vida, 0, len(vidas))
	
	for i in vidas:
		i.visible = false
	
	for i in range(0, len(vidas)):
		if i < vida:
			vidas[i].visible = true
		pass
	
	pass

# Called when the node enters the scene tree for the first time.
func _ready():
	Game.set_obj("game", self)
	var cpuParticles = $bg
	showhealt($nave.vida)
	
	cpuParticles.emitting = true
	pass # Replace with function body.

func playKillSound():
	$kill.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	$Label.text = "Score: " + str(Game.SCORE)
	
	pass

func spawn_enemy(NODE: PackedScene, pos: Vector2):
	var e: Node2D = NODE.instantiate()
	
	$enemys.call_deferred("add_child", e)
	
	e.global_position = pos
	pass


func generate_enemy(enemy):
	
	match enemy:
		ENEMYES.ALIEN:
			spawn_enemy(ALIEN, Vector2(randi_range(0, longpage), $ypos.global_position.y))
			pass
		
	pass

func gameover():
	print("Fin del juego :c")
	$CanvasLayer.gameover()
	$gameover.play()
	pass

func _on_timer_timeout():
	
	generate_enemy(ENEMYES.ALIEN)
	
	pass # Replace with function body.
