extends Window
#$YGimbal/XGimbal/Camera3D
@onready var timeLabel = $MarginContainer/HBoxContainer/Label

func _notification(what):
	#handles close request 
	if what == NOTIFICATION_WM_CLOSE_REQUEST:
		get_tree().quit() #closes whole program >> need to change this shit

func _process(_delta):
	timeLabel.text = str(GameManager.stopwatch.currentTime)
