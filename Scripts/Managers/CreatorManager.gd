class_name CreatorManager extends Node

#references to respective nodes in mapmaker scene
#instantiated in CamControl.gd
var UI
var map
var cam

var useSnap1 = true
var snapIndex = 0
var ghostBlock

func _init():
	pass

func _process(_delta):
	if ghostBlock:
		var res = raycast_from_mouse(cam.get_viewport().get_mouse_position(),1)
		if typeof(res) == TYPE_VECTOR3:
			ghostBlock.position = res
		else:
			snap_ghost_block(res.collider.get_parent(), res.position)
			ghostBlock.snappedGhost = true
	
	if Input.is_action_just_pressed("Jump"):
		export_map()
	
	if Input.is_action_just_pressed("Key_R"):
		snapIndex += 1
		if snapIndex >= ghostBlock.listOfSnapPoints.size():
			snapIndex = 0

#undos block placed last 
func undo():
	if map.get_child_count() > 0:
		var lastPlaced = map.get_child(-1)
		if is_instance_valid(lastPlaced):
			lastPlaced.delete()

#called when a block is selected 
func add_ghost_block():
	if ((UI.selectedOption != null)):
		if ghostBlock != null:
			ghostBlock.queue_free()
		var node = UI.selectedOption.instantiate()
		#config node
		node.set_name("Ghost Block")
		node.isGhost = true
		node.transparency = 0.9
		node.find_child("StaticBody3D").set_collision_layer(0)
		#add node
		map.add_sibling(node)
		ghostBlock = node

func rotate_ghost_block(angle):
	ghostBlock.rotation = Vector3(0, angle, 0)

func hide_ghost_block():
	if ghostBlock != null:
		ghostBlock.visible = false

func show_ghost_block():
	if ghostBlock != null:
		ghostBlock.visible = true

func snap_ghost_block(block, mousePos):
	snap_blocks(block, ghostBlock, mousePos)

func unsnap_ghost_block():
	ghostBlock.snappedGhost = false
	ghostBlock.unlock_snaps()

#adds block to map
func add_block(mPos):
	#dont add shit if nothing is selected 
	if UI.selectedOption == null:
		return
	#instantiate the node and add block as a child of the map
	var node = UI.selectedOption.instantiate()
	map.add_child(node)
	#need to raycast from the mouse
	var res = raycast_from_mouse(mPos, 1)
	#if it didn't hit anything it will be a vector3 
	if typeof(res) == TYPE_VECTOR3:
		# -1 is the last child added
		map.get_child(-1).position = res
		return
	#otherwise it is a dictonary
	snap_blocks(res.collider.get_parent(), map.get_child(-1), res.position)

#returns position of intersection or max point along the ray if no intersection
func raycast_from_mouse(mPos, collisionMask):
	var rayStart = cam.project_ray_origin(mPos)
	var rayEnd = rayStart + cam.project_ray_normal(mPos) * 20#raylength
	
	var space = cam.get_world_3d().direct_space_state
	if space == null:
		return
	
	var query = PhysicsRayQueryParameters3D.create(rayStart, rayEnd, collisionMask)
	query.hit_back_faces = false
	#query.collide_with_areas = true
	
	var res = space.intersect_ray(query)
	if res:
		return res
	else:
		return rayEnd

#snaps BLOCK2 onto BLOCK1
func snap_blocks(block1, block2, collisionPos = null):
	if collisionPos == null:
		collisionPos = block2.global_position
	
	var block2Snaps = block2.listOfSnapPoints
	
	var closestSnap = block1.get_closest_snap(collisionPos)
	#closestSnap will be null if all snap points are taken already 
	if closestSnap != null:
		block2Snaps[snapIndex].snap(closestSnap)

func export_map():
	var save = PackedScene.new()
	for i in map.get_children():
		i.set_owner(map)
	
	save.pack(map)
	ResourceSaver.save(save, "res://newMap.tscn")
