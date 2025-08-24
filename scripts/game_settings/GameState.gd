extends Node

var save_path = "user://save_game.dat"
var current_scene_path := ""  

func save_progress():
	var file = FileAccess.open(save_path, FileAccess.WRITE)
	file.store_var({"scene": current_scene_path})
	file.close()
	print("✅ Progresso salvo:", current_scene_path)

func load_progress():
	if FileAccess.file_exists(save_path):
		var file = FileAccess.open(save_path, FileAccess.READ)
		var data = file.get_var()
		file.close()
		return data["scene"]
	return null
