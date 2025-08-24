extends Node2D

@onready var inimigo = $Detetive_script
@onready var player = $player_script
@onready var botoes = [
	$CanvasLayer/UI/HBoxContainer/camomila,
	$CanvasLayer/UI/HBoxContainer/po_de_prata,
	$CanvasLayer/UI/HBoxContainer/aconito
]

@onready var mensagem = $CanvasLayer/UI/VBoxContainer/Mensagem

var turno_do_jogador = true

func _ready():
	inimigo.morreu.connect(_on_inimigo_morreu)
	botoes[0].pressed.connect(func(): _realizar_ataque("Camomila", 10))
	botoes[1].pressed.connect(func(): _realizar_ataque("Pó de Prata", 30))
	botoes[2].pressed.connect(func(): _realizar_ataque("Aconito", 25))
	limpar_mensagem()

func _realizar_ataque(nome_ataque: String, dano: int):
	if not turno_do_jogador:
		return
		
	desativar_botoes()
	exibir_mensagem("Você usou " + nome_ataque + "!")

	inimigo.tomar_dano(dano)
	await get_tree().create_timer(1.0).timeout
	
	if is_instance_valid(inimigo) and inimigo.hp > 0:
		turno_do_jogador = false
		exibir_mensagem("O inimigo vai atacar!")
		await get_tree().create_timer(1.0).timeout
		inimigo.atacar_jogador(player)

		if player.hp <= 0:
			exibir_mensagem("Você foi derrotado!")
			return
		
		turno_do_jogador = true
		exibir_mensagem("Seu turno!")
		ativar_botoes()
		

func desativar_botoes():
	for b in botoes:
		b.disabled = true
		
func ativar_botoes():
	for b in botoes:
		b.disabled = false
		
func exibir_mensagem(texto: String):
	mensagem.text = texto
	
func limpar_mensagem():
	mensagem.text = ""

func _on_inimigo_morreu():
	await get_tree().create_timer(1.5).timeout
	get_tree().change_scene_to_file("res://scenes/levels/primeiraCena.tscn")
