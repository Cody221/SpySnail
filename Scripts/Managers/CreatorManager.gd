class_name CreatorManager extends Node

#references to respective nodes in mapmaker scene
#instantiated in CamControl.gd
var options
var map
var cam

var useSnap1 = true

func _init():
	pass

func _process(_delta):
	if Input.is_action_just_pressed("Key_R"):
		useSnap1 = !useSnap1

#adds block to map
func add_block(mPos):
	#dont add shit if nothing is selected 
	if options.selectedOption == null:
		return
	#instantiate the node and add block as a child of the map
	var node = options.selectedOption.instantiate()
	map.add_child(node)
	#need to raycast from the mouse
	var res = raycast_from_mouse(mPos, 1)
	#if it didn't hit anything it will be a vector3 
	if typeof(res) == TYPE_VECTOR3:
		# -1 is the last child added
		map.get_child(-1).position = res
		return
	#otherwise it is a dictonary
	snap_blocks(res.position, res.collider, map.get_child(-1))
	

#returns position of intersection or max point along the ray if no intersection
func raycast_from_mouse(mPos, collisionMask):
	var rayStart = cam.project_ray_origin(mPos)
	var rayEnd = rayStart + cam.project_ray_normal(mPos) * 20#raylength
	
	var space = cam.get_world_3d().direct_space_state
	if space == null:
		return
	
	var query = PhysicsRayQueryParameters3D.create(rayStart, rayEnd, collisionMask)
	query.collide_with_areas = true
	
	var res = space.intersect_ray(query)
	if res:
		return res
	else:
		return rayEnd

#snaps block2 onto block1
func snap_blocks(collisionPos, block1, block2):
	#get parent of staticbody 
	block1 = block1.get_parent()
	#get snapping points of collider
	var snap1 = block1.get_child(1)
	var snap2 = block1.get_child(2)
	#get snapping points of block2
	var block2snap
	if useSnap1:
		block2snap = block2.get_child(1)
	else:
		block2snap = block2.get_child(2)
	
	if ((collisionPos.distance_to(snap1.global_position) < collisionPos.distance_to(snap2.global_position)) and !snap1.isSnapped):
		block2snap.snap(snap1)
	else:
		block2snap.snap(snap2)

	




