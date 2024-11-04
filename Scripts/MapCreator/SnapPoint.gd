extends Node3D

var parent
var isSnapped : bool
var normal : Vector3 #normals are only going to be in x-z axis never any on y 
var snappedTo : Node3D

#snaps this to the passed in snapPoint
func snap(snapPoint):
	snappedTo = snapPoint
	snapPoint.snappedTo = self
	isSnapped = !parent.isGhost
	snapPoint.isSnapped = !parent.isGhost
	#if the snappingPoints normal is NOT the opposite of this normal then rotate the block
	if -normal != snapPoint.normal: 
		var rotateAmount = (Vector2(snapPoint.normal.x, snapPoint.normal.z)).angle_to(-Vector2(normal.x, normal.z))
		#convert all angles to positive 
		parent.rotation = Vector3(0, rotateAmount, 0)
		if parent.isGhost:
			GameManager.creatorManager.rotate_ghost_block(rotateAmount)
		
	#FUNCTIONALITY FOR SNAPPING GHOST
	if parent.isGhost:
		parent.update_normals()
		set_normal()
		parent.global_position  = snapPoint.global_position + position
	else:
		parent.position = snapPoint.global_position - global_position
	#the normals get updated after snapping by the parent

func set_normal():
	var parentx = parent.global_basis.x
	var parentz = parent.global_basis.z
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

