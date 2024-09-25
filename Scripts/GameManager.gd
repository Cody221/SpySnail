extends Node

var stopwatch : Stopwatch
var summaryWindow = preload("res://Scenes/Menus/SummaryWindow.tscn").instantiate()

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
	add_child(summaryWindow)
	# X / 3 stars; finished in X time; etc. 

func Reset():
	DebugLayer.draw.vectors = [] #need to reset the vectors to draw so they don't try drawing vectors on the freed objects after reload 
	stopwatch.currentTime = 0
	remove_child(summaryWindow)
	get_tree().reload_current_scene()
	stopwatch.isPaused = false

func EndLevel():
	Reset()
	LoadScene("res://Scenes/Menus/MainMenu.tscn")

func LoadScene(scene : String): 
	get_tree().change_scene_to_file(scene)
	stopwatch.currentTime = 0.0
