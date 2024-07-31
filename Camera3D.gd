extends Camera3D

@onready var parent = get_parent()
var initialOffset
var currentOffset

# Called when the node enters the scene tree for the first time.
func _ready():
	initialOffset = position - parent.position
	currentOffset = initialOffset


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	look_at_from_position(parent.position + currentOffset, parent.position)
	
	if Input.is_key_pressed(KEY_D):
		currentOffset += Vector3.RIGHT * delta
		
	currentOffset.clamp(Vector3.ZERO, initialOffset)
