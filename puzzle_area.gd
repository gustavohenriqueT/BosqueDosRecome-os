extends Area2D

@export var aura_reward := 20
var total_lixos := 0
var lixos_restantes := 0
var ativo := false

@onready var mensagem_final: Label = $MensagemFinal

func _ready():
	connect("body_entered", Callable(self, "_on_body_entered"))
	connect("body_exited", Callable(self, "_on_body_exited"))

	if MusicController:
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
	if player and player.has_method("coletar_lixo"):
		player.coletar_lixo(tipo)

	if lixos_restantes <= 0:
		puzzle_concluido()

func puzzle_concluido():
	var hud_tasks = get_tree().get_root().find_child("HUD_Tasks", true, false)
	if hud_tasks:
		hud_tasks.completar_tarefa("lixo") 
	
	var spawner = get_tree().get_root().find_child("ButterflySpawner", true, false)
	if spawner:
		spawner.start_spawning()
