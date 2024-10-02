extends Control

class Vector:
	var object #the start of the vector typically the center of the object 
	var property #the end position of the vector typically whatever property you wish to track 
	var magnitude #scale of the vector 
	var width #width of the line
	var color #color!!!
	
	func _init(_object, _property, _magnitude, _width, _color):
		object = _object
		property = _property
		magnitude = _magnitude
		width = _width
		color = _color
	
	func draw(node, cam):
		var objProp = object.get(property)
		var start = cam.unproject_position(object.global_transform.origin)
		if(objProp is Vector2):
			objProp = Vector3(objProp.x, objProp.y, 0)
		
		var end = cam.unproject_position(object.global_transform.origin + objProp)
		node.draw_line(start, end, color, width)
		node.draw_triangle(end, start.direction_to(end), width * 2, color)
	
var vectors = [] #array to hold every vector we wish to draw 

func _process(_delta):
	if not visible:
		return
	queue_redraw()

func _draw():
	var cam = get_viewport().get_camera_3d()
	for vector in vectors:
		vector.draw(self, cam)

func add_vector(object, property, magnitude, width, color):
	vectors.append(Vector.new(object, property, magnitude, width, color))

func draw_triangle(pos, dir, magnitude, color):
	var a = pos + dir * magnitude
	var b = pos + dir.rotated(2*PI/3) * magnitude
	var c = pos + dir.rotated(4*PI/3) * magnitude
	var points = PackedVector2Array([a, b, c])
	draw_polygon(points, PackedColorArray([color]))
