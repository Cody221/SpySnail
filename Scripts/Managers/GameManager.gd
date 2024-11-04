extends Node

enum SCENE_TYPE {MENU, LEVEL, CREATOR}

#current UI
var currentUI 
#manager declaration
var levelManager : LevelManager
var creatorManager : CreatorManager
var debugLayer : DebugLayer
#active manager list
var activeManagers = []
#active scene type
var activeScene : SCENE_TYPE

func _ready():
	#fullscreen 
	#DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	#manager instantiation
	levelManager = LevelManager.new()
	creatorManager = CreatorManager.new()

func _process(delta):
	#manager processing
	for manager in activeManagers:
		manager._process(delta)

func _input(_event):
	pass
	#if event is InputEventKey:
		#if event.pressed and event.keycode == KEY_ESCAPE:
			#levelManager.Reset()
			##pass

func LoadScene(scene : String, sceneType):
	get_tree().change_scene_to_file(scene)
	
	#every time a new scene is loaded it should unload the nonrequierd managers and load the required ones 
	activeManagers = []
	
	match sceneType:
		SCENE_TYPE.MENU:
			activeScene = SCENE_TYPE.MENU
		SCENE_TYPE.LEVEL:
			activeManagers.append(levelManager)
			debugLayer = DebugLayer.new()
			activeScene = SCENE_TYPE.LEVEL
		SCENE_TYPE.CREATOR:
			activeManagers.append(creatorManager)
			activeScene = SCENE_TYPE.CREATOR
