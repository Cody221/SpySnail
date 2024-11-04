class_name DebugArrow extends MeshInstance3D

var property
var parent
var length

func _init(myParent, myProperty):
	mesh = CylinderMesh.new()
	mesh.cap_top = false
	mesh.bottom_radius = 0.08
	mesh.top_radius = 0.01
	parent = myParent
	property = myProperty
	top_level = true
	parent.add_child(self)

func _process(_delta):
	mesh.height = parent.drawDirection.length()
	align_with_vector(parent.drawDirection)
	pass

func align_with_vector(vector):
	position = parent.position + basis.y * (mesh.height/2)
	basis = Basis(Vector3(1, 0, 0), vector.normalized(), Vector3(0, 0, 1))
	#rotation = Vector3(vector.x, 0, vector.y)
	
