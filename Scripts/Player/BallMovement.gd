extends RigidBody3D

# Get the gravity from the project settings to be synced with RigidBody nodes.
#var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
var direction = Vector2.ZERO
#essentially a copy of direction just used to be compatible with the draw.add_vector and be oriented the correct way
var drawDirection = Vector3.ZERO 
var start = Vector3.ZERO
var end = Vector3.ZERO

var jumpAllowed : bool = true
@export var numberOfJumps : int
var jumpForce : float
@onready var yGimbal = $YGimbal

var drawArrow

func _ready():
	if GameManager.activeScene == GameManager.SCENE_TYPE.CREATOR:
		sleeping = true
		set_process(false)
		GameManager.creatorManager.play_testing.connect(start_ball)
	drawArrow = DebugArrow.new(self, drawDirection)

func _process(delta):
	GameManager.currentUI.jumpBar.value = jumpForce
	handle_input(delta)
	
	if position.y <= -40:
		GameManager.levelManager.Reset()

func start_ball():
	set_process(true)

func handle_input(delta):
	if(Input.is_action_just_pressed("LeftMouse")):
		start = get_viewport().get_mouse_position()

	if(Input.is_action_pressed("LeftMouse")):
		end = get_viewport().get_mouse_position()
		direction = start - end
		direction = direction.rotated(-yGimbal.rotation.y) * delta
		drawDirection = Vector3(direction.x, 0, direction.y)

	if(Input.is_action_just_released("LeftMouse")):
		set_axis_velocity(Vector3(direction.x, 0, direction.y)) #don't need to multiply by delta here(already did)
		drawDirection = Vector3.ZERO
	
	if(Input.is_action_pressed("Jump")):
		if jumpForce < 10:
			jumpForce += delta * 5.0
	
	if(Input.is_action_just_released("Jump") and jumpAllowed):
		set_axis_velocity(Vector3(0, jumpForce, 0))
		jumpForce = 0 

