extends RigidBody3D

# Get the gravity from the project settings to be synced with RigidBody nodes.
#var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
var direction = Vector3.ZERO
var start = Vector3.ZERO
var end = Vector3.ZERO

@onready var cam = $YGimbal/XGimbal/Camera3D

func _physics_process(_delta):
	if(Input.is_action_just_pressed("LeftMouse")):
		#start = cam.project_position(get_viewport().get_mouse_position(), cam.position.z)
		DebugLayer.draw.DebugVector.new()
	
	if(Input.is_action_pressed("LeftMouse")):
		start = position
		end = get_viewport().get_mouse_position()
		end = cam.project_position(end, cam.position.z)
		direction = start - end
	
	if(Input.is_action_just_released("LeftMouse")):
		linear_velocity = direction
		direction = Vector3.ZERO
		




