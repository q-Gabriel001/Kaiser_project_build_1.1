extends Area2D

@onready var indicador = $Sprite2D2

var player_na_area = false

func _ready():
	connect("body_entered", _on_body_entered)
	connect("body_exited", _on_body_exited)
	indicador.visible = false

func _on_body_entered(body):
	if body.name == "player":
		player_na_area = true
		indicador.visible = true  # Mostra o balão

func _on_body_exited(body):
	if body.name == "player":
		player_na_area = false
		indicador.visible = false # Some o balão

func _process(delta):
	if player_na_area and Input.is_action_just_pressed("interact"):
		iniciar_dialogo()

func iniciar_dialogo():
	Dialogic.start(dialog_file)
