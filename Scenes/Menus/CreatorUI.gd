extends MarginContainer

@export var map : Node3D

@onready var optionButton = $HBoxContainer/VBoxContainer/OptionButton
var selectedOption

#preloading all the blocks for instantiation
var straight = preload("res://Scenes/MapBuildingBlocks/straight.tscn")
var curve = preload("res://Scenes/MapBuildingBlocks/curve.tscn")
var goal = preload("res://Scenes/MapBuildingBlocks/goal_square.tscn")
var rampD = preload("res://Scenes/MapBuildingBlocks/ramp_d_long.tscn")
var helixLeft = preload("res://Scenes/MapBuildingBlocks/helix_left.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the end lapsed time since the previous frame.
func _process(_delta):
	match optionButton.selected:
		0:
			selectedOption = straight
		1:
			selectedOption = curve
		2:
			selectedOption = rampD
		3:
			selectedOption = goal
		_:
			selectedOption = null
