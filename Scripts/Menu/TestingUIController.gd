extends MarginContainer

@onready var restartButton = $SummaryWindow/HBoxContainer/VBoxContainer/RestartButton
@onready var restartButton2 = $PauseMenu/HBoxContainer/VBoxContainer/RestartButton
@onready var returnButton = $SummaryWindow/HBoxContainer/VBoxContainer/ReturnButton
@onready var returnToBuildButton = $PauseMenu/HBoxContainer/VBoxContainer/ReturnButton
@onready var sumWindow = $SummaryWindow
@onready var jumpBar = $HBoxContainer2/VBoxContainer/TextureProgressBar
@onready var pauseMenu = $PauseMenu

func _ready():
	GameManager.currentUI = self
	restartButton.pressed.connect(GameManager.levelManager.Reset)
	restartButton2.pressed.connect(GameManager.levelManager.Reset)
	returnButton.pressed.connect(GameManager.levelManager.EndLevel)
	GameManager.levelManager.level_complete.connect(sumWindow.show)
	returnToBuildButton.pressed.connect(return_to_build)

func return_to_build():
	GameManager.LoadScene("res://Scenes/Maps/MapMaker.tscn",GameManager.SCENE_TYPE.CREATOR)
	GameManager.creatorManager.import_map()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_just_pressed("Pause"):
		pauseMenu.visible = !pauseMenu.visible




