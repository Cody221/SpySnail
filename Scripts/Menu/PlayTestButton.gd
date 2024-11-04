extends Button


func _pressed():
	GameManager.creatorManager.export_map()
	GameManager.LoadScene("res://newMap.tscn", GameManager.SCENE_TYPE.LEVEL)
	GameManager.creatorManager.play_testing.emit()
