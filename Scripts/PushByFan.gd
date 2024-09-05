extends Node3D

@export var fanRange: int
@export var fanPower : int

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta):
	var space = get_world_3d().direct_space_state
	
	#start of ray is position and range is the fan range
	#seperate query for each point around the fan plus the center 
	
	#var localXAxis = Vector3(transform.basis.x).normalized() * 1.2
	#var localYAxis = Vector3(transform.basis.y)
	#var localZAxis = Vector3(transform.basis.z)
	#var res = Vector3(global_position.x * 1.1, global_position.y, global_position.z * 1.1)
	
	var query0 = PhysicsRayQueryParameters3D.create(global_position, global_transform.basis.y.normalized() * fanRange, 2)
	#var query1 = PhysicsRayQueryParameters3D.create(res, global_transform.basis.y.normalized() * fanRange, 2)
	#var query2 = PhysicsRayQueryParameters3D.create(position, global_transform.basis.y.normalized() * fanRange)
	#var query3 = PhysicsRayQueryParameters3D.create(position, global_transform.basis.y.normalized() * fanRange)
	#var query4 = PhysicsRayQueryParameters3D.create(position, global_transform.basis.y.normalized() * fanRange)
	
	var array = [query0]
	
	var result
	 
	for i in array.size():
		array[i].set_collision_mask(2) #collisionMask 2 is the players layer 
		result = space.intersect_ray(array[i])
		if result:
			result.collider.linear_velocity = global_transform.basis.y * fanPower
			break
	
