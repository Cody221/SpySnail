extends Node

func _input(event):
	if event is InputEventKey:
		if event.pressed and event.keycode == KEY_ESCAPE:
			Reset()

func EndGame():
	#probably want to display an end of game summary
	# X / 3 stars; finished in X time; etc. 
	Reset()#HERE FOR TESTING < it's causing errors

func Reset():
	DebugLayer.draw.vectors = [] #need to reset the vectors to draw so they don't try drawing vectors on the freed objects after reload 
	get_tree().reload_current_scene()
