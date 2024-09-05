extends RigidBody3D

# Get the gravity from the project settings to be synced with RigidBody nodes.
#var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
var direction = Vector3.ZERO
var start = Vector3.ZERO
var end = Vector3.ZERO


@export var moveSpeed : int
@onready var cam = $YGimbal/XGimbal/Camera3D

func _ready():
	DebugLayer.draw.add_vector(self, "direction", 1, 4, Color(0, 1, 0, 0.5))
	pass

func _physics_process(delta):
	var initPos = Vector3.ZERO
	if(Input.is_action_just_pressed("LeftMouse")):
		initPos = get_viewport().get_mouse_position()
		initPos = cam.project_position(initPos, cam.position.z)
		start = position
		
	
	if(Input.is_action_pressed("LeftMouse")):
		end = get_viewport().get_mouse_position()
		end = cam.project_position(end, cam.position.z)
		if((initPos - end).length() <= 0.5):
			return
		direction = start - end
	
	if(Input.is_action_just_released("LeftMouse")):
		#need to factor camera position into how the force is applied 
		linear_velocity = Vector3(direction.x, 0, direction.z) * moveSpeed
		direction = Vector3.ZERO
		

func process_movement(initial_velocity, new_velocity):
	if(initial_velocity.angle_to(new_velocity) >= PI):
		linear_velocity = new_velocity + initial_velocity.length()



