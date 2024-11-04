extends MeshInstance3D

@onready var myMesh = $StaticBody3D

@export var listOfSnapPoints : Array[Node3D]
var prevRotation
#FUNCTIONALITY FOR SNAPPING GHOST
var isGhost = false
var snappedGhost = false

# Called when the node enters the scene tree for the first time.
func _ready():
	if GameManager.activeScene == GameManager.SCENE_TYPE.CREATOR:
		#FUNCTIONALITY FOR SNAPPING GHOST
		if !isGhost:
			#myMesh.mouse_entered.connect(func(): GameManager.creatorManager.snap_ghost_block(self))
			myMesh.mouse_exited.connect(func(): GameManager.creatorManager.unsnap_ghost_block())
		prevRotation = rotation

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if GameManager.activeScene == GameManager.SCENE_TYPE.CREATOR:
		if (prevRotation != rotation):
			update_normals()
			prevRotation = rotation

func update_normals():
	for i in listOfSnapPoints:
		i.normal = i.normal.rotated(global_basis.y, rotation.y)

func unlock_snaps():
	for i in listOfSnapPoints:
		if i.snappedTo != null and i.isSnapped:
			i.snappedTo.isSnapped = false


#get closest snap point on this block(pass in a global position)
func get_closest_snap(pos, ignoreSnappedPoints = false):
	var closestDist = 99.9
	var closestSnap
	for snap in listOfSnapPoints:
		if !snap.isSnapped and !ignoreSnappedPoints:
			var distance = pos.distance_to(snap.global_position)
			if distance < closestDist:
				closestDist = distance
				closestSnap = snap
	return closestSnap

func delete():
	unlock_snaps()
	queue_free()
