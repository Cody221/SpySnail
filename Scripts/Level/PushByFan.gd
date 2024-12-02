extends "res://Scripts/MapCreator/SnapPointContainer.gd"

@onready var particles = $CPUParticles3D
@export var fanRange: int
@export var fanPower : int
var direction

func _ready():
	#DebugLayer.draw.add_vector(self, "direction", 1, 4, Color(0, 1, 0, 0.5))
	particles.lifetime = fanRange / 10.0 #lifetime should be within 0-1
	particles.amount = fanPower 
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var space = get_world_3d().direct_space_state
	direction = global_transform.basis.y.normalized() * fanRange
	
	#start of ray is position and range is the position + direction
	#seperate query for each point around the fan plus the center maybe necessary 
	var query = PhysicsShapeQueryParameters3D.new()
	var shape = CylinderShape3D.new()
	shape.height = fanRange
	shape.radius = 0.4
	query.transform = transform.translated_local(Vector3(0, shape.height / 2, 0))
	query.shape_rid = shape.get_rid()
	query.collision_mask = 2
	var res = space.intersect_shape(query)
	
	
	if res:
		res[0].collider.linear_velocity = direction * fanPower
	
	#var query0 = PhysicsRayQueryParameters3D.create(position, position + direction, 2)
	#var result = space.intersect_ray(query0)
	
	#if result:
	#	result.collider.linear_velocity = direction * fanPower
	
