extends Node3D

var parent
var isSnapped : bool
var linkedSnapPoint : Node3D
var normal : Vector3 #normals are only going to be in x-z axis never any on y 

#snaps this to the passed in snapPoint
func snap(snapPoint : Node3D):
	linkedSnapPoint = snapPoint
	snapPoint.linkedSnapPoint = self
	#normals of both snapping points need to be opposite (pointing at each other) 
	#first make sure normals are pointed at each other (rotate the block to be snapped)[the passed in one]
	if -normal != snapPoint.normal: 
		var rotateAmount = (Vector2(normal.x, normal.z)).angle_to(Vector2(snapPoint.normal.x, snapPoint.normal.z))
		parent.position = parent.position.rotated(Vector3.UP, rotateAmount)
	#then set their global positions equal
	#set parent position to the snappoint + position of it's own snappoint 
	parent.position = snapPoint.global_position + position

# Called when the node enters the scene tree for the first time.
func _ready():
	parent = get_parent()
	#determine normals
	#dot the offset(of the snappoint to parent position) with x and z axis
	#whichever is bigger is the axis that we use for the normal
	var x = (global_position-parent.global_position).dot(Vector3(1, 0, 0))
	var z = (global_position-parent.global_position).dot(Vector3(0, 0, 1))
	if  x > z:
		normal = Vector3(x*1, 0 ,0).normalized()
	else:
		normal = Vector3(0, 0, z*1).normalized()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

