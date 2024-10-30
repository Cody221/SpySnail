extends MarginContainer

@onready var timeLabel = $HBoxContainer/VBoxContainer/Label
@onready var endofLevelTime = $SummaryWindow/HBoxContainer/VBoxContainer/Label
@onready var restartButton = $SummaryWindow/HBoxContainer/VBoxContainer/RestartButton
@onready var returnButton = $SummaryWindow/HBoxContainer/VBoxContainer/ReturnButton
@onready var sumWindow = $SummaryWindow

func _ready():
	restartButton.pressed.connect(GameManager.levelManager.Reset)
	returnButton.pressed.connect(GameManager.levelManager.EndLevel)
	GameManager.levelManager.level_complete.connect(sumWindow.show)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	timeLabel.text = "Time:  " + str(snapped(GameManager.levelManager.stopwatch.currentTime, 0.01))
	endofLevelTime.text = "Time: " + str(snapped(GameManager.levelManager.stopwatch.currentTime, 0.01))




