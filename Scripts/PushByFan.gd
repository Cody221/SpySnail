extends Node3D

@export var fanRange: int

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta):
	var space = get_world_3d().direct_space_state
	#start of ray is position and range is the fan range
	#seperate query for each point around the fan plus the center 
	
	#need to factor the rotation of x and z axis to correctly push ball
	var fanDirection = Vector3(rotation.x, 0, rotation.z).normalized()

	
	var r = Vector3(fanRange, fanRange, fanRange).bounce(rotation)
	global_rotation
	
	var query0 = PhysicsRayQueryParameters3D.create(position, position + rotation.normalized() * fanRange)
	#var query1 = PhysicsRayQueryParameters3D.create(position + Vector3(0, 0, 0.5), position + rangeVector)
	#var query2 = PhysicsRayQueryParameters3D.create(position + Vector3(0, 0, -0.5), position + rangeVector)
	#var query3 = PhysicsRayQueryParameters3D.create(position + Vector3(0.5, 0, 0), position + rangeVector)
	#var query4 = PhysicsRayQueryParameters3D.create(position + Vector3(-0.5, 0, 0), position + rangeVector)
	
	var array = [query0]
	
	var result
	
	for i in array.size():
		array[i].set_collision_mask(2) #collisionMask 2 is the players layer 
		result = space.intersect_ray(array[i])
		if result:
			result.collider.linear_velocity = rotation.normalized() * fanRange
			break
	
