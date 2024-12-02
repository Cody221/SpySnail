extends MarginContainer

@onready var optionButton = $HBoxContainer/VBoxContainer/OptionButton
@onready var deleteButton = $HBoxContainer/VBoxContainer/DeleteButton
@onready var pauseMenu = $PauseMenu
var selectedOption = null

#preloading all the blocks for instantiation
var playerBall = preload("res://Scenes/PlayerBall.tscn")
var straight = preload("res://Scenes/MapBuildingBlocks/straight.tscn")
var curve = preload("res://Scenes/MapBuildingBlocks/curve.tscn")
var goal = preload("res://Scenes/MapBuildingBlocks/goal_square.tscn")
var rampD = preload("res://Scenes/MapBuildingBlocks/ramp_d_long.tscn")
#var helixLeft = preload("res://Scenes/MapBuildingBlocks/helix_left.tscn")
var splitLeft = preload("res://Scenes/MapBuildingBlocks/split_left.tscn")
var splitRight = preload("res://Scenes/MapBuildingBlocks/split_right.tscn")
var splitBoth = preload("res://Scenes/MapBuildingBlocks/split_double_sides.tscn")
var rampStart = preload("res://Scenes/MapBuildingBlocks/ramp_start_d.tscn")
var slantLong = preload("res://Scenes/MapBuildingBlocks/slant_long_d.tscn")
var fan = preload("res://Scenes/MapBuildingBlocks/ActionBuildingBlocks/fan_four.tscn")
#var tp = preload("res://Scenes/MapBuildingBlocks/ActionBuildingBlocks/teleporter.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
	GameManager.currentUI = self
	optionButton.item_selected.connect(input)
	deleteButton.toggled.connect(func(x): GameManager.creatorManager.deleting = x)

# Called every frame. 'delta' is the end lapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_just_pressed("Pause"):
		pauseMenu.visible = !pauseMenu.visible 

func input(choice):
	match choice:
		#0:#Start
			#selectedOption = playerBall
			#GameManager.creatorManager.placingStart = true
		0:#Finish
			selectedOption = goal
			GameManager.creatorManager.add_ghost_block()
			GameManager.creatorManager.snapIndex = 0
		1:#straight
			selectedOption = straight
			GameManager.creatorManager.add_ghost_block()
			GameManager.creatorManager.snapIndex = 0
		2:#Curve
			selectedOption = curve
			GameManager.creatorManager.add_ghost_block()
			GameManager.creatorManager.snapIndex = 0
		3:#Steep Ramp
			selectedOption = rampD
			GameManager.creatorManager.add_ghost_block()
			GameManager.creatorManager.snapIndex = 0
		4:
			selectedOption = splitLeft
			GameManager.creatorManager.add_ghost_block()
			GameManager.creatorManager.snapIndex = 0
		5:
			selectedOption = splitRight
			GameManager.creatorManager.add_ghost_block()
			GameManager.creatorManager.snapIndex = 0
		6:
			selectedOption = rampStart
			GameManager.creatorManager.add_ghost_block()
			GameManager.creatorManager.snapIndex = 0
		7:
			selectedOption = slantLong
			GameManager.creatorManager.add_ghost_block()
			GameManager.creatorManager.snapIndex = 0
		8:
			selectedOption = splitBoth
			GameManager.creatorManager.add_ghost_block()
			GameManager.creatorManager.snapIndex = 0
		10:
			selectedOption = fan
			GameManager.creatorManager.add_ghost_block()
			GameManager.creatorManager.snapIndex = 0
		#10:
			#selectedOption = tp
			#GameManager.creatorManager.add_ghost_block()
			#GameManager.creatorManager.snapIndex = 0
		_:
			selectedOption = null
