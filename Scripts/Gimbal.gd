#YGimbal controls rotation about the y axis
#XGimbal controls rotation about the x axis
extends Node3D

@onready var inner = $XGimbal
@onready var cam = $XGimbal/Camera3D

@export var mouseSens = 0.005
var invertY = false
var invertX = false

func _process(_delta):
	global_position = get_parent().global_position
	inner.rotation.x = clamp(inner.rotation.x, -1.4, 1.4)
	

func _unhandled_input(event):
	if (event is InputEventMouseMotion and Input.is_action_pressed("RightMouse")):
		#mouse moved in x direction
		if event.relative.x != 0:
			var dir = 1 if invertX else -1
			rotate_object_local(Vector3.UP, dir * event.relative.x * mouseSens)
		
		#mouse moved in y direction
		if event.relative.y != 0:
			var dir = 1 if invertY else -1
			inner.rotate_object_local(Vector3.RIGHT, dir * event.relative.y * mouseSens)
