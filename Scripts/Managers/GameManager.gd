extends Node

enum SCENE_TYPE {MENU, LEVEL, CREATOR}

#signals for scene loads
signal creator_loaded
#manager declaration
var levelManager : LevelManager
var creatorManager : CreatorManager
var debugLayer : DebugLayer
#active manager list
var activeManagers = []

func _ready():
	#manager instantiation
	levelManager = LevelManager.new()
	creatorManager = CreatorManager.new()

func _process(delta):
	#manager processing
	for manager in activeManagers:
		manager._process(delta)

func _input(event):
	if event is InputEventKey:
		if event.pressed and event.keycode == KEY_ESCAPE:
			levelManager.Reset()

func LoadScene(scene : String, sceneType):
	get_tree().change_scene_to_file(scene)
	
	#every time a new scene is loaded it should unload the nonrequierd managers and load the required ones 
	activeManagers = []
	
	match sceneType:
		SCENE_TYPE.MENU:
			pass
		SCENE_TYPE.LEVEL:
			activeManagers.append(levelManager)
			debugLayer = DebugLayer.new()
		SCENE_TYPE.CREATOR:
			activeManagers.append(creatorManager)
