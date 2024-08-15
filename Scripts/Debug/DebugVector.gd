extends Control

var target
var property
var scale
var width
var color
var cam

func _init(target, prop, scale, w, color, cam):
	self.target = target
	property = prop 
	self.scale = scale
	width = w
	self.color = color
	self.cam = cam
	

func _draw():
	var start = cam.unproject_position(target.global_transform.origin)
	var end = cam.unproject_position(target.global_transform.origin + target.direction)
	draw_line(start, end, color, 1)
	DrawTriangle(end, end - start, 0.1, color)

func DrawTriangle(pos, dir, size, color):
	var a = pos + dir * size
	var b = pos + dir.rotated(2*PI/3) * size
	var c = pos + dir.rotated(4*PI/3) * size
	var points = PackedVector2Array([a, b, c])
	draw_polygon(points, PackedColorArray([color]))

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
