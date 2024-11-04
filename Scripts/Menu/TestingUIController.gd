extends MarginContainer

@onready var restartButton = $SummaryWindow/HBoxContainer/VBoxContainer/RestartButton
@onready var restartButton2 = $PauseMenu/HBoxContainer/VBoxContainer/RestartButton
@onready var returnButton = $SummaryWindow/HBoxContainer/VBoxContainer/ReturnButton
@onready var returnToTestButton = $PauseMenu/HBoxContainer/VBoxContainer/ReturnButton
@onready var sumWindow = $SummaryWindow
@onready var jumpBar = $HBoxContainer2/VBoxContainer/TextureProgressBar
@onready var pauseMenu = $PauseMenu

func _ready():
	GameManager.currentUI = self
	restartButton.pressed.connect(GameManager.levelManager.Reset)
	returnButton.pressed.connect(GameManager.levelManager.EndLevel)
	GameManager.levelManager.level_complete.connect(sumWindow.show)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_just_pressed("Pause"):
		pauseMenu.visible = !pauseMenu.visible




