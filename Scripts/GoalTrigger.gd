extends Area3D


# Called when the node enters the scene tree for the first time.
func _ready():
	connect("body_entered", _area_body_entered)

func _area_body_entered(_body):
	GameManager.ShowEndScreen()
