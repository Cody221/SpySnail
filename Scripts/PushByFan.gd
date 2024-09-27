extends Node3D

@export var fanRange: int
@export var fanPower : int
var direction

func _ready():
	#DebugLayer.draw.add_vector(self, "direction", 1, 4, Color(0, 1, 0, 0.5))
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta):
	var space = get_world_3d().direct_space_state
	direction = global_transform.basis.y * fanRange
	
	#start of ray is position and range is the position + direction
	#seperate query for each point around the fan plus the center maybe necessary 
	var query0 = PhysicsRayQueryParameters3D.create(position, position + direction, 2)
	var result = space.intersect_ray(query0)
	
	if result:
		result.collider.linear_velocity = global_transform.basis.y * fanPower
	
