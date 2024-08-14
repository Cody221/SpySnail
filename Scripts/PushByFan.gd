extends Node3D

@export var fanRange: int

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var space = get_world_3d().direct_space_state
	#start of ray is position and range is the fan range
	var query0 = PhysicsRayQueryParameters3D.create(position, position + Vector3(0, fanRange, 0))
	var query1 = PhysicsRayQueryParameters3D.create(position + Vector3(0, 0, 0.5), position + Vector3(0, fanRange, 0))
	var query2 = PhysicsRayQueryParameters3D.create(position + Vector3(0, 0, -0.5), position + Vector3(0, fanRange, 0))
	var query3 = PhysicsRayQueryParameters3D.create(position + Vector3(0.5, 0, 0), position + Vector3(0, fanRange, 0))
	var query4 = PhysicsRayQueryParameters3D.create(position + Vector3(-0.5, 0, 0), position + Vector3(0, fanRange, 0))
	
	var array = [query0, query1, query2, query3, query4]
	
	var result
	
	for i in array.size():
		array[i].set_collision_mask(2)
		result = space.intersect_ray(array[i])
		if result:
			result.collider.linear_velocity = Vector3(0, 10, 0)
			break
	
