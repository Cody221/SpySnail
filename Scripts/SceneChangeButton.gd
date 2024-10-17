extends Button

@export var scenePath : String
@export var sceneType : GameManager.SCENE_TYPE

func _pressed():
	GameManager.LoadScene(scenePath, sceneType)
