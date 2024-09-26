extends MarginContainer

@onready var timeLabel = $HBoxContainer/VBoxContainer/Label

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	timeLabel.text = "Time:  " + str(snapped(GameManager.stopwatch.currentTime, 0.01))
