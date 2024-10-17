extends Camera3D

@export var mouseSens = 0.25
@export var camSpeed = 5

# Called when the node enters the scene tree for the first time.
func _ready():
	GameManager.creatorManager.map = $"../Map"
	GameManager.creatorManager.options = $"../UI"
	GameManager.creatorManager.cam = self

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	handle_movement(delta)

func _unhandled_input(event):
	if (event is InputEventMouseMotion):
		if(Input.is_action_pressed("RightMouse")):
			#hide the mouse
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
			#mouse moved in x direction
			if event.relative.x != 0:
				rotation_degrees.y -= event.relative.x * mouseSens 
			
			#mouse moved in y direction
			if event.relative.y != 0:
				rotation_degrees.x -= event.relative.y * mouseSens
			
	if(Input.is_action_just_released("LeftMouse")):
		GameManager.creatorManager.add_block(event.position)
	
	#show the mouse on release
	if(!Input.is_action_pressed("RightMouse")):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		
	#need to clamp rotation so cam can't spin a direction infinitely
	rotation_degrees.x = clamp(rotation_degrees.x, -90, 90)

func handle_movement(delta):
	if Input.is_action_pressed("Up"):
		position += Vector3.UP * delta * camSpeed
	
	if Input.is_action_pressed("Down"):
		position += -Vector3.UP * delta * camSpeed
	
	if Input.is_action_pressed("Forward"):
	#needs to be reversed to go forward 
		position += -global_basis.z * delta * camSpeed
	
	if Input.is_action_pressed("Back"):
		#basis.z points backwards  
		position += global_basis.z * delta * camSpeed
	
	if Input.is_action_pressed("Left"):
		#needs to be reversed to go left
		position += -global_basis.x * delta * camSpeed
	
	if Input.is_action_pressed("Right"):
		position += global_basis.x * delta * camSpeed


