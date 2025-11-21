extends Area2D

@export var aura_reward := 20
var total_lixos := 0
var lixos_restantes := 0
var ativo := false
@onready var mensagem_final: Label = $MensagemFinal

func _ready():
	connect("body_entered", Callable(self, "_on_body_entered"))
	connect("body_exited", Callable(self, "_on_body_exited"))
	MusicController.tocar_para_cena("puzzle_area")

	total_lixos = $Lixos.get_child_count()
	lixos_restantes = total_lixos

	for lixo in $Lixos.get_children():
		if lixo.has_signal("lixo_coletado"):
			lixo.connect("lixo_coletado", Callable(self, "_on_lixo_coletado"))

func _on_body_entered(body):
	if body.name == "Lumi":
		ativo = true

func _on_body_exited(body):
	if body.name == "Lumi":
		ativo = false

func _on_lixo_coletado(tipo: String):
	lixos_restantes -= 1
	var player = get_tree().get_root().find_child("Lumi", true, false)
	if player:
		player.coletar_lixo(tipo)

	if lixos_restantes <= 0:
		puzzle_concluido()

func puzzle_concluido():
	print("Área limpa! +" + str(aura_reward) + " aura")
	_mostrar_mensagem_final("Área limpa! +" + str(aura_reward) + " aura")
	
	var spawner = get_tree().get_root().find_child("ButterflySpawner", true, false)
	
	if spawner:
		spawner.start_spawning()


func _mostrar_mensagem_final(texto: String):
	mensagem_final.text = texto
	mensagem_final.visible = true
	mensagem_final.modulate.a = 0.0
	mensagem_final.scale = Vector2(0.8, 0.8)

	var tween = create_tween()
	tween.parallel().tween_property(mensagem_final, "modulate:a", 1.0, 0.8).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
	tween.parallel().tween_property(mensagem_final, "scale", Vector2(1.2, 1.2), 1.0).set_trans(Tween.TRANS_SINE)
	await tween.finished

	await get_tree().create_timer(1.5).timeout

	var fade = create_tween()
	fade.tween_property(mensagem_final, "modulate:a", 0.0, 1.2).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
	await fade.finished

	mensagem_final.visible = false
