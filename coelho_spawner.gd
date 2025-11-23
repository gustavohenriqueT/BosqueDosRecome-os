extends Node2D

@export var cena_coelho: PackedScene 
@export var quantidade: int = 5
@export var raio_spawn: float = 100.0

func spawnar_coelho():
	if not cena_coelho:
		print("ERRO: Cena do coelho não configurada no Spawner!")
		return
		
	print("Spawnando coelhos!")
	
	for i in range(quantidade):
		var coelho = cena_coelho.instantiate()
		
		var pos_aleatoria = Vector2(
			randf_range(-raio_spawn, raio_spawn),
			randf_range(-raio_spawn, raio_spawn)
		)
		coelho.position = global_position + pos_aleatoria
		
		get_tree().current_scene.add_child(coelho)
