extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
# Get the gravity from the project settings to be synced with RigidBody nodes.
#var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var inDialogueRange = false
var textBoxOpen = false
@onready var textBox = self.get_node("Control")
@onready var textLabel = self.get_node("Control/RichTextLabel")
var texts = Array()
var index = 0;

func _displayText(index):
	if(index < texts.size()):
		textLabel.text = texts[index]
	
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
	
	if(index > texts.size()):
		textBoxOpen = false
	
	if textBoxOpen:
		velocity = Vector2(0,0)
		textBox.visible = true
		if(Input.is_action_just_pressed("MouseClick")): 
			_displayText(index)
			index = index + 1
	elif inDialogueRange && Input.is_action_just_pressed("MouseClick"):
		textBoxOpen = true
		_displayText(index)
		index = index + 1
	else:
		textBox.visible = false
		index = 0
		
		
	move_and_slide()
	

