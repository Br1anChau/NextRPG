extends Node2D

var player
var enemies = Array()
var positionChangeArray = [100,100,-100,-100]
@onready var enemyClass = preload("res://Scenes/Enemy.tscn")
var numOfEnemies

# Called when the node enters the scene tree for the first time.
func _ready():
	player = get_node("CombatPlayer")
	numOfEnemies = randi() % 4 + 1
	enemies.resize(numOfEnemies)
	for i in numOfEnemies:
		var negativeX = randi() % 2
		var negativeY = randi() % 2
		var enemy = enemyClass.instantiate()
		add_child(enemy)
		var positionXChange = randi() % 100
		var positionYChange = randi() & 100
		if(i % 2 == 0):
			enemy.position.x = player.position.x + positionChangeArray[i]
		else:
			enemy.position.y = player.position.y + positionChangeArray[i]
		enemies[i] = enemy
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	for i in numOfEnemies:
		if(is_instance_valid(enemies[i])):
			enemies[i].playerPosition = player.position
	pass
