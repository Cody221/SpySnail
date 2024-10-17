extends Button

@export var menuToHide : Control
@export var menuToShow : Control

func _pressed():
	menuToHide.hide()
	menuToShow.show()

