extends Camera3D

@onready var parent = get_parent()
var initialOffset
var currentOffset

# Called when the node enters the scene tree for the first time.
func _ready():
	initialOffset = position - parent.position
	currentOffset = initialOffset

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	#follow the ball w/ an offset 
	position = parent.position + currentOffset 
	look_at(parent.position)
	

func _input(event):
	if (event is InputEventMouseMotion and Input.is_action_pressed("RightMouse")):
		if event.velocity.x < 0: #mouse moving left
			pass
		if (event.velocity.x > 0): #mouse moving right
			currentOffset += Vector3.MODEL_RIGHT * get_process_delta_time()
			
