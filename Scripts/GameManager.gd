extends Node

var stopwatch : Stopwatch
signal level_complete

func _ready():
	stopwatch = Stopwatch.new()


func _process(delta):
	stopwatch._process(delta)#need to call stopwatch tick function

func _input(event):
	if event is InputEventKey:
		if event.pressed and event.keycode == KEY_ESCAPE:
			Reset()

func ShowEndScreen():
	#probably want to display an end of game summary
	stopwatch.isPaused = true
	level_complete.emit()
	# X / 3 stars; finished in X time; etc.

func Reset():
	DebugLayer.draw.vectors = [] #need to reset the vectors to draw so they don't try drawing vectors on the freed objects after reload 
	stopwatch.currentTime = 0
	get_tree().reload_current_scene()
	stopwatch.isPaused = false

func EndLevel():
	Reset()
	LoadScene("res://Scenes/Menus/MainMenu.tscn")

func LoadScene(scene : String): 
	get_tree().change_scene_to_file(scene)
	stopwatch.currentTime = 0.0
