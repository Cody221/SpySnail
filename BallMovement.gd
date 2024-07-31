extends RigidBody3D


const SPEED = 5.0
const JUMP_VELOCITY = 4.5

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
var direction 
var start = 0
var end

func _physics_process(delta):
	if(Input.is_action_just_pressed("LeftMouse")):
		start = get_viewport().get_mouse_position()
	
	if(Input.is_action_just_released("LeftMouse")):
		end = get_viewport().get_mouse_position()
		
		direction = (end - start)
		
		apply_impulse(Vector3(-direction.x, direction.y, 0) * delta)
	

