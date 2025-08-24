extends Area2D

@export var dialog_file: String = "res://timeline/npc_capuz.dtl"
@onready var indicador = $indicador
var ja_conversou = false
var player_na_area = false

func _ready():
	print(indicador)
	connect("body_entered", _on_body_entered)
	connect("body_exited", _on_body_exited)
	indicador.visible = false

func _on_body_entered(body):
	if body.name == "player_move":
		player_na_area = true
		if not ja_conversou:
			indicador.visible = true

func _on_body_exited(body):
	if body.name == "player_move":
		player_na_area = false
		indicador.visible = false

func _process(delta):
	if player_na_area and Input.is_action_just_pressed("interact") and not ja_conversou:
		iniciar_dialogo()

func iniciar_dialogo():
	Dialogic.start(dialog_file)
	ja_conversou = true
	indicador.visible = false
