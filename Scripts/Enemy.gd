extends CharacterBody2D


const SPEED = 150.0
const JUMP_VELOCITY = -400.0
@onready var bullet = preload("res://Scenes/projectile.tscn")

# Get the gravity from the project settings to be synced with RigidBody nodes.
var playerPosition = Vector2(0,0)

func _ready():
	print("Hello")

func _physics_process(delta):
	# Add the gravity.
	velocity = velocity.move_toward(playerPosition, delta * SPEED)
	if(self.position.x - playerPosition.x > 0):
		velocity.x = velocity.x * -1
	if(self.position.y - playerPosition.y > 0):
		velocity.y = velocity.y * -1
	
	
	if(position.distance_to(playerPosition) < 50):
		velocity.y = velocity.y * -1
		velocity.x = velocity.x * -1
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	move_and_slide()


func _on_timer_timeout():
	var newBullet = bullet.instantiate()
	add_child(newBullet)
	newBullet.velocity = newBullet.velocity.move_toward(playerPosition, SPEED)
	pass # Replace with function body.
