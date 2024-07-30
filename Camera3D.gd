extends Node3D

@export var offset: Vector3

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	position = get_parent().position - offset
	look_at_from_position(position, get_parent().position)
	
	if Input.is_action_pressed("RightMouse"):
		pass
		
func _input(event):
	if (event is InputEventMouseMotion and Input.is_action_pressed("RightMouse")):
		position *= Vector3(event.get_velocity().x,event.get_velocity().y, 0)
