extends Area3D

@export var otherTP : Node3D
var allowTP = true
# Called when the node enters the scene tree for the first time.
func _ready():
	connect("body_entered", _on_area_body_entered)
	connect("body_exited", _on_area_body_exited)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _on_area_body_entered(body):
	if allowTP:
		body.position = otherTP.position
		otherTP.allowTP = false
		
func _on_area_body_exited(body):
	allowTP = true

