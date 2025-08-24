extends CanvasLayer

func _ready() -> void:
	pass

func _on_iniciar_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/levels/main.tscn")


func _on_continuar_pressed() -> void:
	var last_scene = GameState.load_progress()
	if last_scene:
		get_tree().change_scene_to_file(last_scene)
	else:
		get_tree().change_scene_to_file("res://scenes/levels/main.tscn")

func _on_opcoes_pressed() -> void:
	
	pass # Replace with function body.


func _on_sair_pressed() -> void:
	get_tree().quit()
