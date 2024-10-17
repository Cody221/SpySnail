extends RigidBody3D

# Get the gravity from the project settings to be synced with RigidBody nodes.
#var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
var direction = Vector2.ZERO
#essentially a copy of direction just used to be compatible with the draw.add_vector and be oriented the correct way
var drawDirection = Vector3.ZERO 
var start = Vector3.ZERO
var end = Vector3.ZERO
var jumpsLeft = 0

@export var numberOfJumps : int
@export var jumpForce : int
#@onready var cam = $YGimbal/XGimbal/Camera3D
@onready var yGimbal = $YGimbal

#var mesh

func _ready():
	#GameManager.debugLayer.draw2D.add_vector(self, "drawDirection", 1, 4, Color(0, 1, 0, 0.5))
	#scene start end width color
	#DebugLayer.draw3D.add_mesh(get_tree().current_scene, )
	
	#mesh = MeshInstance3D.new()
	#mesh.mesh = CylinderMesh.new()
	#add_child(mesh)
	#mesh.top_level = true
	#mesh.mesh.top_radiu
	#mesh.rotation.x = 60
	#
	
	contact_monitor = true
	max_contacts_reported = 1
	pass

func _process(delta):
	#mesh.position = position
	#mesh.rotation.y = drawDirection.y
	#mesh.mesh.height = drawDirection.length()
	if(Input.is_action_just_pressed("LeftMouse")):
		start = get_viewport().get_mouse_position()

	if(Input.is_action_pressed("LeftMouse")):
		end = get_viewport().get_mouse_position()
		direction = start - end
		direction = direction.rotated(-yGimbal.rotation.y) * delta
		drawDirection = Vector3(direction.x, 0, direction.y)

	if(Input.is_action_just_released("LeftMouse")):
		set_axis_velocity(Vector3(direction.x, 0, direction.y)) #don't need to multiply by delta here since already did before
		drawDirection = Vector3.ZERO
	
	
	if(Input.is_action_just_pressed("Jump") and (jumpsLeft > 0)):
		set_axis_velocity(Vector3(0, jumpForce, 0))
		jumpsLeft -= 1   
	
	if position.y <= -40:
		GameManager.Reset()
		
	#check for contacts to reset jumps
	if get_contact_count() != 0:
		jumpsLeft = numberOfJumps

func _physics_process(delta):
	pass
	




