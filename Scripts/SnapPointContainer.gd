extends MeshInstance3D

@export var ListofSnapPoints : Array[Node3D]
var prevRotation

# Called when the node enters the scene tree for the first time.
func _ready():
	prevRotation = rotation

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if prevRotation != rotation:
		update_normals()
		prevRotation = rotation

func update_normals():
	for i in ListofSnapPoints:
		i.normal = i.normal.rotated(basis.y, rotation.y)
		


