extends Button

@export var scenePath : String

func _pressed():
	GameManager.LoadScene(scenePath)
