class_name Stopwatch extends Node

var currentTime : float 
var isPaused

#constructor
func _init(time = 0.0, paused = false):
	currentTime = time
	isPaused = paused

# needs to be called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	currentTime += delta
