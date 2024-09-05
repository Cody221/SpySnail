extends Node3D

@export var fanRange: int

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta):
	var space = get_world_3d().direct_space_state
	
	#start of ray is position and range is the fan range
	#seperate query for each point around the fan plus the center 
	var query0 = PhysicsRayQueryParameters3D.create(position, global_transform.basis.y.normalized() * fanRange)
	#var query1 = PhysicsRayQueryParameters3D.create(position + , global_transform.basis.y.normalized() * fanRange)
	#var query2 = PhysicsRayQueryParameters3D.create(position, global_transform.basis.y.normalized() * fanRange)
	#var query3 = PhysicsRayQueryParameters3D.create(position, global_transform.basis.y.normalized() * fanRange)
	#var query4 = PhysicsRayQueryParameters3D.create(position, global_transform.basis.y.normalized() * fanRange)
	
	var array = [query0]
	
	var result
	 
	for i in array.size():
		array[i].set_collision_mask(2) #collisionMask 2 is the players layer 
		result = space.intersect_ray(array[i])
		if result:
			result.collider.linear_velocity = global_transform.basis.y * fanRange
			break
	
