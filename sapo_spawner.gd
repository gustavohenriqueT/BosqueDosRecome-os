extends Node2D

@export var cena_sapo: PackedScene 
@export var quantidade: int = 5
@export var raio_spawn: float = 100.0

func spawnar_sapos():
	if not cena_sapo:
		print("ERRO: Cena do sapo não configurada no Spawner!")
		return
		
	print("Spawnando sapos!")
	
	for i in range(quantidade):
		var sapo = cena_sapo.instantiate()
		
		var pos_aleatoria = Vector2(
			randf_range(-raio_spawn, raio_spawn),
			randf_range(-raio_spawn, raio_spawn)
		)
		sapo.position = global_position + pos_aleatoria
		
		get_tree().current_scene.add_child(sapo)
