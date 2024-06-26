extends Node

var objs = {}

func set_obj(key, obj): objs[key] = obj
func get_obj(key): return objs.get(key, false)

var SCORE = 0
var BestScore = 0

func add_score(sc: int):
	SCORE += sc

# Called when the node enters the scene tree for the first time.
func _ready():
	loadscore()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func savescore():
	var fs = FileAccess.open("user://score.json", FileAccess.WRITE)
	var data= {
		"BestScore": BestScore
	}
	
	var json = JSON.new()
	
	var cadena = json.stringify(data)
	
	fs.store_string(cadena)
	
	pass

func loadscore():
	if FileAccess.file_exists("user://score.json"):
		var fs = FileAccess.open("user://score.json", FileAccess.READ)
		var json = JSON.new()
		var cadena = fs.get_as_text()
		var data = json.parse_string(cadena)
		
		BestScore = data["BestScore"]
	
	
	pass
