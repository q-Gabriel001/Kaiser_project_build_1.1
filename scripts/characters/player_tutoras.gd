extends Node2D

@onready var barra_vida = $Player/hp_player

var hp = 100
var hp_max = 100

func levar_dano(dano: int):
	hp = max(hp - dano, 0)
	animar_barra(hp)
	if hp == 0:
		morrer()

func animar_barra(valor: int):
	# Cria tween via script
	var tween := get_tree().create_tween()
	

	# Faz a barra de vida animar suavemente
	tween.tween_property(barra_vida, "value", valor, 0.3)\
		.set_trans(Tween.TRANS_LINEAR)\
		.set_ease(Tween.EASE_IN_OUT)

	# Destroi o tween após a animação
	await get_tree().create_timer(0.4).timeout
	tween.tween_callback($player.queue_free)

func morrer():
	print("Player derrotado!")
