extends Node2D

@onready var detetive = $inimigo
@onready var barra_vida = $Inimigo/hp_inimigo
signal morreu

var hp = 100
var ivulneravel = false

func tomar_dano(dano: int):
	
	var tween = get_tree().create_tween()
	
	if ivulneravel:
		return
		
	hp = max(hp - dano, 0)
	animar_barra(hp)
	ivulneravel = true
	
	#Tween para piscar
	var tween_piscar = get_tree().create_tween()
	
	detetive.modulate.a = 1.0
	
	tween_piscar.tween_property(detetive, "modulate:a", 0.0, 0.1)
	tween_piscar.tween_property(detetive, "modulate:a", 1.0, 0.1)
	tween_piscar.tween_property(detetive, "modulate:a", 0.0, 0.1)
	tween_piscar.tween_property(detetive, "modulate:a", 1.0, 0.1)
	
	await get_tree().create_timer(0.6).timeout
	tween_piscar.tween_callback($inimigo.queue_free)
	ivulneravel = false
	
	if hp == 0:
		morrer()
	
func animar_barra(valor: int):
	var tween_barra = get_tree().create_tween()
	
	tween_barra.tween_property(barra_vida, "value", valor, 0.3)
	
	await get_tree().create_timer(0.4).timeout
	tween_barra.tween_callback($Inimigo/hp_inimigo.queue_free)
	
func atacar_jogador(player: Node):
	print("Inimigo atacou!")
	player.levar_dano(15)
	
func morrer():
	print("Inimigo derrotado!")
	emit_signal("morreu")
	queue_free()
	
