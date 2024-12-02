extends Button

@export var scenePath : String
@export var sceneType : GameManager.SCENE_TYPE

func _pressed():
	if scenePath == null:
		GameManager.levelManager.Reset()
	else:
		if sceneType == GameManager.SCENE_TYPE.MENU:
			get_tree().paused = false
		GameManager.LoadScene(scenePath, sceneType)
