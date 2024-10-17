class_name LevelManager extends Node

var stopwatch : Stopwatch
signal level_complete

func _init():
	stopwatch = Stopwatch.new()

func _process(delta):
	stopwatch._process(delta)#need to call stopwatch tick function

func Reset():
	GameManager.debugLayer.draw2D.vectors = [] #need to reset the vectors to draw so they don't try drawing vectors on the freed objects after reload 
	stopwatch.currentTime = 0
	GameManager.get_tree().reload_current_scene()
	stopwatch.isPaused = false

func EndLevel():
	Reset()
	GameManager.LoadScene("res://Scenes/Menus/MainMenu.tscn", GameManager.SCENE_TYPE.MENU)

func ShowEndScreen():
	#probably want to display an end of game summary
	stopwatch.isPaused = true
	level_complete.emit()
	# X / 3 stars; finished in X time; etc.
