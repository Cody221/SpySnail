extends Camera3D

@export var mouseSens = 0.25

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.  

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	handle_movement(delta)

func _unhandled_input(event):
	if (event is InputEventMouseMotion and Input.is_action_pressed("RightMouse")):
		#mouse moved in x direction
		if event.relative.x != 0:
			rotation_degrees.y -= event.relative.x * mouseSens 
		
		#mouse moved in y direction
		if event.relative.y != 0:
			rotation_degrees.x -= event.relative.y * mouseSens
	#need to clamp rotation so cam can't spin a direction infinitely 
	rotation_degrees.x = clamp(rotation_degrees.x, -90, 90)

func handle_movement(delta):
	if Input.is_action_pressed("Jump"):
		position += Vector3.UP * delta
	
	if Input.is_action_pressed("Forward"):
	#needs to be reversed to go forward 
		position += -global_basis.z * delta
	
	if Input.is_action_pressed("Back"):
		#basis.z points backwards 
		position += global_basis.z * delta
	
	if Input.is_action_pressed("Left"):
		#needs to be reversed to go left
		position += -global_basis.x * delta
	
	if Input.is_action_pressed("Right"):
		position += global_basis.x * delta
