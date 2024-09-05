extends RigidBody3D

# Get the gravity from the project settings to be synced with RigidBody nodes.
#var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
var direction = Vector2.ZERO
var start = Vector3.ZERO
var end = Vector3.ZERO

@export var moveSpeed : int
#@onready var cam = $YGimbal/XGimbal/Camera3D
@onready var yGimbal = $YGimbal

func _ready():
	DebugLayer.draw.add_vector(self, "direction", 1, 4, Color(0, 1, 0, 0.5))
	pass

func _physics_process(delta):
	if(Input.is_action_just_pressed("LeftMouse")):
		start = get_viewport().get_mouse_position()
	
	if(Input.is_action_pressed("LeftMouse")):
		end = get_viewport().get_mouse_position()
		#end = cam.project_position(end, cam.position.z)
		direction = start - end
		direction = direction.rotated(-yGimbal.rotation.y)
		
	
	if(Input.is_action_just_released("LeftMouse")):
		linear_velocity = Vector3(direction.x, 0, direction.y) * delta
		direction = Vector2.ZERO
		

func process_movement(initial_velocity, new_velocity):
	if(initial_velocity.angle_to(new_velocity) >= PI):
		linear_velocity = new_velocity + initial_velocity.length()



