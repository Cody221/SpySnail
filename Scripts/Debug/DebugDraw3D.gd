extends Node3D

var activeScene
var meshes = [] #list of boxes to draw 

class DrawMesh:
	var start #initial position to draw from
	var end #ending position to draw to 
	var width #width!!!
	var color #color!!!
	var mesh
	
	func _init(_start, _end, _width, _color):
		start = _start
		end = _end
		width = _width
		color = _color
		mesh = MeshInstance3D.new()
		mesh.mesh = CylinderMesh.new()
	
	func update():
		pass

func updateBoxes(delta):
	for mesh in meshes:
		mesh.update(delta)

#adds a box to the list to be updated 
func add_mesh(start, end, width, color):
	meshes.append(DrawMesh.new(start, end, width, color))
	
