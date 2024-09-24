extends TextureButton

@export var scenePath : String

func _pressed():
	get_tree().change_scene_to_file(scenePath)
