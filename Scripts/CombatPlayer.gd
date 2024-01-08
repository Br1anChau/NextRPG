extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
# Get the gravity from the project settings to be synced with RigidBody nodes.
#var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var spear

func _ready():
	spear = get_node("Spear")
	spear.visible = true
	spear.position = Vector2(0,0)

func _physics_process(delta):
	# Add the gravity.
#	if not is_on_floor():
#		velocity.y += gravity * delta
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var ydirection = Input.get_axis("ui_up", "ui_down")
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	if ydirection:
		velocity.y = ydirection * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)
	
	self.look_at(get_global_mouse_position())
	if(Input.is_action_just_pressed("MouseClick")):
		spear.visible = true
		get_node("Spear/SpearSprite/AnimationPlayer").play("Thrust")
		
	move_and_slide()


func _on_spear_body_entered(body):
	if body.is_in_group("enemy"):
		body.free()
		Global.money += 10
