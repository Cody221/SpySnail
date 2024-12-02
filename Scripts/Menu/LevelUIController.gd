extends MarginContainer

@onready var timeLabel = $HBoxContainer/VBoxContainer/Label
@onready var endofLevelTime = $SummaryWindow/HBoxContainer/VBoxContainer/Label
@onready var restartButton = $SummaryWindow/HBoxContainer/VBoxContainer/RestartButton
@onready var returnButton = $SummaryWindow/HBoxContainer/VBoxContainer/ReturnButton
@onready var sumWindow = $SummaryWindow
@onready var jumpBar = $HBoxContainer2/VBoxContainer/TextureProgressBar
@onready var escMenu = $EscMenu
@onready var resumeButton = $EscMenu/HBoxContainer/VBoxContainer/ResumeButton

func _ready():
	GameManager.currentUI = self
	restartButton.pressed.connect(GameManager.levelManager.Reset)
	returnButton.pressed.connect(GameManager.levelManager.EndLevel)
	GameManager.levelManager.level_complete.connect(sumWindow.show)
	resumeButton.pressed.connect(resume)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_just_pressed("Pause"):
		get_tree().paused = !get_tree().paused
		escMenu.visible = !escMenu.visible 
	
	timeLabel.text = "Time:  " + str(snapped(GameManager.levelManager.stopwatch.currentTime, 0.01))
	endofLevelTime.text = "Time: " + str(snapped(GameManager.levelManager.stopwatch.currentTime, 0.01))

func resume():
	get_tree().paused = !get_tree().paused
	escMenu.visible = false


