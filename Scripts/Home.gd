extends Node2D
@export var currentScene = String()
@export var combatScene = String()

# Called when the node enters the scene tree for the first time.
func _ready():
	Global.overWorldScene = currentScene
	Global.combatScene = self.combatScene
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
