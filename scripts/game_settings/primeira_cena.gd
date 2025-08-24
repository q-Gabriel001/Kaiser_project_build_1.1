extends Node2D

@onready var prota := $MainChar
@onready var osvaldo := $Detetive
@onready var background := $Background1
@onready var background1 := $ColorRect


func _ready():
	Dialogic.paused = false
	var dialogic = Dialogic.start("Cena1_2")
	Dialogic.signal_event.connect(DialogicSignal)


func DialogicSignal(argument: String):
	if argument == "isla":
		$MainChar.scale.x = 1
		osvaldo.visible = false
	elif argument == "scene_switch":
		osvaldo.visible = false
		prota.visible = false
		background.visible = false
		background1.visible = true
		await get_tree().create_timer(1.5).timeout
		get_tree().change_scene_to_file("res://scenes/levels/lindobar.tscn")
	
