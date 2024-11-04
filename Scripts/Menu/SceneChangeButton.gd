extends Button

@export var scenePath : String
@export var sceneType : GameManager.SCENE_TYPE

func _pressed():
	if scenePath == null:
		GameManager.levelManager.Reset()
	else:
		GameManager.LoadScene(scenePath, sceneType)
