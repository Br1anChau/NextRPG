extends Node2D

@export var textArray = Array()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_body_entered(body):
	if(body.name == "Player"):
		body.inDialogueRange = true
		body.texts = textArray
	pass # Replace with function body.


func _on_area_2d_body_exited(body):
	if(body.name == "Player"):
		body.inDialogueRange = false
	pass # Replace with function body.
