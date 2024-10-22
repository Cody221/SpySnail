extends Node3D

var parent
var isSnapped : bool
var normal : Vector3 #normals are only going to be in x-z axis never any on y 

#snaps this to the passed in snapPoint
func snap(snapPoint):
	isSnapped = true
	snapPoint.isSnapped = true
	#normals of both snapping points need to be opposite (pointing at each other) 
	#if the snappingPoints normal is NOT opposite of this normal then rotate the block
	if -normal != snapPoint.normal: 
		var rotateAmount = (Vector2(snapPoint.normal.x, snapPoint.normal.z)).angle_to(-Vector2(normal.x, normal.z))
		#convert all angles to positive 
		parent.rotation = Vector3(0, rotateAmount, 0)
	#then set their global positions equal
	#set parent position to the snappoint + offset between snapped points
	parent.position = snapPoint.global_position - global_position

func set_normal():
	var parentx = parent.basis.x
	var parentz = parent.basis.z
	#var x = position.dot(parentx)
	#var z = position.dot(parentz)
	var x = global_position.project(parentx).length()
	var y = global_position.project(parentz).length()
	if x > y:
		normal = Vector3(position.x, 0 ,0).sign()
	else:
		normal = Vector3(0, 0, position.z).sign()

# Called when the node enters the scene tree for the first time.
func _ready():
	parent = get_parent()
	set_normal()
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

