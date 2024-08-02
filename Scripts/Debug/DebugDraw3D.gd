extends Control

@onready var ball = $/root/Node3D/PlayerBall
@onready var cam = $/root/Node3D/PlayerBall/YGimbal/XGimbal/Camera3D

class Vector:
	var target
	var property
	var scale
	var width
	var color


func _process(_delta):
	queue_redraw()

func _draw():
	var color = Color(0, 1, 0)
	var start = cam.unproject_position(ball.global_transform.origin)
	var end = cam.unproject_position(ball.global_transform.origin + ball.direction)
	draw_line(start, end, color, 1)
	DrawTriangle(end, end - start, 0.1, color)

func DrawTriangle(pos, dir, size, color):
	var a = pos + dir * size
	var b = pos + dir.rotated(2*PI/3) * size
	var c = pos + dir.rotated(4*PI/3) * size
	var points = PackedVector2Array([a, b, c])
	draw_polygon(points, PackedColorArray([color]))
