extends Node2D

@export var recompensa_aura := 40

var totalCanteiros := 0
var canteirosConcluidos := 0

@onready var mensagemFinal: Label = $MensagemFinal

func _ready():
	var grupoCanteiros = $Canteiros
	totalCanteiros = grupoCanteiros.get_child_count()

	for c in grupoCanteiros.get_children():
		if c.has_signal("canteiro_concluido"):
			c.connect("canteiro_concluido", Callable(self, "_on_canteiro_concluido"))

	print("Total de canteiros no puzzle:", totalCanteiros)

	mensagemFinal.visible = false

func _on_canteiro_concluido():
	canteirosConcluidos += 1
	print("Canteiros concluídos:", canteirosConcluidos, "/", totalCanteiros)

	if canteirosConcluidos >= totalCanteiros:
		_puzzle_concluido()

func _puzzle_concluido():
	print("Puzzle de plantação concluído! +" + str(recompensa_aura), " aura")

	var player = get_tree().get_root().find_child("Lumi", true, false)
	if player:
		player.add_aura(recompensa_aura)

	_mostrar_mensagem_final("Plantação perfeita! +" + str(recompensa_aura) + " aura")

	# opcional: chamar borboletas
	var spawner = get_tree().get_root().find_child("ButterflySpawner", true, false)
	if spawner:
		spawner.start_spawning()

func _mostrar_mensagem_final(texto: String):
	mensagemFinal.text = texto
	mensagemFinal.visible = true
	mensagemFinal.modulate.a = 0.0
	mensagemFinal.scale = Vector2(0.8, 0.8)

	var tween = create_tween()
	tween.parallel().tween_property(mensagemFinal, "modulate:a", 1.0, 0.8)
	tween.parallel().tween_property(mensagemFinal, "scale", Vector2(1.2, 1.2), 1.0)
	await tween.finished

	await get_tree().create_timer(1.5).timeout

	var fade = create_tween()
	fade.tween_property(mensagemFinal, "modulate:a", 0.0, 1.2)
	await fade.finished

	mensagemFinal.visible = false
