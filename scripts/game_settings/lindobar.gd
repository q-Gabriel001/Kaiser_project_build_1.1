extends Node2D

@onready var npc := $NPC/HomemEncapuzadoPng
@onready var indicador := $NPC/indicador
@onready var lindobarback := $LindobarBack
@onready var playerM := $player_move
@onready var islaM := $CharacterBody2D
@onready var background1 := $ColorRect



func _ready() -> void:
	islaM.visible = true
	GameState.current_scene_path = get_tree().current_scene.scene_file_path
	GameState.save_progress()
	Dialogic.signal_event.connect(DialogicSignal)
	
func DialogicSignal(argument: String):
	if argument == "scene_discussao":
		lindobarback.visible = false
		npc.visible = false
		playerM.visible = false
		islaM.visible = true
		background1.visible = true
		await get_tree().create_timer(1.5).timeout
		get_tree().change_scene_to_file("res://scenes/levels/discussao.tscn")
	
	
