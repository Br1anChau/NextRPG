extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
#
## Get the gravity from the project settings to be synced with RigidBody nodes.
#var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	move_and_slide()


func _on_character_body_2d_body_entered(body):
	print("Hitting")
	if(body.name == "CombatPlayer"):
		Global.health = Global.health - 1
		self.free()
	pass # Replace with function body.
