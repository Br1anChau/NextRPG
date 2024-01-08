extends Node

var health = 10
var money = 0
var Inventory = Array()

# Called when the node enters the scene tree for the first time.
func _ready():
	Inventory.resize(3)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if health <= 0:
		reset()
	pass
	
func reset():
	health = 10
	money = 0
	get_tree().change_scene_to_file("res://Scenes/StartScene.tscn")
