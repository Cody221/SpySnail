extends MarginContainer

@export var map : Node3D

@onready var optionButton = $HBoxContainer/VBoxContainer/OptionButton
var selectedOption

var straight = preload("res://Scenes/MapBuildingBlocks/straight.tscn")
var curve = preload("res://Scenes/MapBuildingBlocks/curve.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	match optionButton.selected:
		0:
			selectedOption = straight
		1:
			selectedOption = curve
		2:
			pass
		_:
			selectedOption = null
