extends Node2D

func _ready():
	GameState.current_scene_path = get_tree().current_scene.scene_file_path
	GameState.save_progress()
	var dialogic = Dialogic.start("discussao")
