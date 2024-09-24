extends Window
#$YGimbal/XGimbal/Camera3D
@onready var timeLabel = $MarginContainer/HBoxContainer/VBoxContainer/Label
@onready var restartButton = $MarginContainer/HBoxContainer/VBoxContainer/RestartButton
@onready var returnButton = $MarginContainer/HBoxContainer/VBoxContainer/ReturnButton

func _ready():
	connect("close_requested", hide) #hide is hiding the window 
	restartButton.pressed.connect(GameManager.Reset)
	returnButton.pressed.connect(GameManager.EndLevel)

func _process(_delta):
	timeLabel.text = "Time: " + str(snapped(GameManager.stopwatch.currentTime, 0.01))
	


