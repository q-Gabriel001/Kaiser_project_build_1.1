extends CanvasLayer


@onready var label = $Panel/Label
@onready var botao = $Panel/BotaoFechar

var fila_dicas: Array[String] = []
var indice_atual: int = 0
var callback_final: Callable = null


func _ready():
	visible = false
	botao.pressed.connect(_avancar_dica)

func mostrar_dicas(lista_dicas: Array[String], quando_terminar = null):
	if lista_dicas.is_empty():
		return
	
	fila_dicas = lista_dicas
	indice_atual = 0
	callback_final = quando_terminar
	
	visible = true
	get_tree().paused = true
	_exibir_dica_atual()

func _exibir_dica_atual():
	label.text = fila_dicas[indice_atual]
	if indice_atual == fila_dicas.size() - 1:
		botao.text = "Entendi"
	else:
		botao.text = "Próximo"

func _avancar_dica():
	indice_atual += 1
	
	if indice_atual < fila_dicas.size():
		_exibir_dica_atual()
	else:
		# Fim das dicas
		get_tree().paused = false
		visible = false
		if callback_final != null:
			callback_final.call()
