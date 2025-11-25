extends Node2D

@export var cena_cogumelo: PackedScene 
@export var quantidade: int = 5
@export var raio_spawn: float = 100.0

func spawnar_cogumelo():
	if not cena_cogumelo:
		print("ERRO: Cena do cogumelo não configurada no Spawner!")
		return
		
	print("Spawnando Cogumelos!")
	
	for i in range(quantidade):
		var cogumelo = cena_cogumelo.instantiate()
		
		var pos_aleatoria = Vector2(
			randf_range(-raio_spawn, raio_spawn),
			randf_range(-raio_spawn, raio_spawn)
		)
		cogumelo.position = global_position + pos_aleatoria
		
		get_tree().current_scene.add_child(cogumelo)
