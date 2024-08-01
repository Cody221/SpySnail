extends RigidBody3D

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
var direction
var start = 0
var end

@onready var cam = $YGimbal/XGimbal/Camera3D

func _physics_process(delta):
	
	if(Input.is_action_just_pressed("LeftMouse")):
		start = get_viewport().get_mouse_position()
		start = cam.project_position(start, cam.position.z)
	
	if(Input.is_action_just_released("LeftMouse")):
		end = get_viewport().get_mouse_position()
		end = cam.project_position(end, cam.position.z)
		
		direction = (end - start)
		
		apply_impulse(Vector3(-direction.x, direction.y, direction.z))
		
		



