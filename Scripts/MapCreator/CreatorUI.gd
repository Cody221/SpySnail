extends MarginContainer

@onready var optionButton = $HBoxContainer/VBoxContainer/OptionButton
var selectedOption = null

#preloading all the blocks for instantiation
var playerBall = preload("res://Scenes/PlayerBall.tscn")
var straight = preload("res://Scenes/MapBuildingBlocks/straight.tscn")
var curve = preload("res://Scenes/MapBuildingBlocks/curve.tscn")
var goal = preload("res://Scenes/MapBuildingBlocks/goal_square.tscn")
var rampD = preload("res://Scenes/MapBuildingBlocks/ramp_d_long.tscn")
var helixLeft = preload("res://Scenes/MapBuildingBlocks/helix_left.tscn")
var splitLeft = preload("res://Scenes/MapBuildingBlocks/split_left.tscn")
var splitRight = preload("res://Scenes/MapBuildingBlocks/split_right.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
	optionButton.item_selected.connect(input)

# Called every frame. 'delta' is the end lapsed time since the previous frame.
func _process(_delta):
	pass

func input(choice):
	match choice:
		0:#Start
			selectedOption = playerBall
			#GameManager.creatorManager.add_ghost_block()
		1:#Finish
			selectedOption = goal
			GameManager.creatorManager.add_ghost_block()
		2:#straight
			selectedOption = straight
			GameManager.creatorManager.add_ghost_block()
		3:#Curve
			selectedOption = curve
			GameManager.creatorManager.add_ghost_block()
		4:#Steep Ramp
			selectedOption = rampD
			GameManager.creatorManager.add_ghost_block()
		5:
			selectedOption = splitLeft
			GameManager.creatorManager.add_ghost_block()
		6:
			selectedOption = splitRight
			GameManager.creatorManager.add_ghost_block()
		_:
			selectedOption = null
