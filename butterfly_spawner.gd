extends Node2D

@export var butterfly_scene: PackedScene
@onready var spawn_timer: Timer = $SpawnTimer
@onready var spawn_points: Node = $SpawnPoints

var ativo := false

func start_spawning():
	print("BORBOLETAS ATIVADAS!")
	ativo = true
	spawn_timer.start()

func _on_spawn_timer_timeout():
	if not ativo:
		return

	var pontos = spawn_points.get_children()
	if pontos.is_empty():
		print("Nenhum ponto de spawn encontrado!")
		return

	var spawn_point = pontos.pick_random()

	var butterfly = butterfly_scene.instantiate()
	butterfly.global_position = spawn_point.global_position

	print("Spawnando borboleta em:", butterfly.global_position)

	get_tree().current_scene.add_child(butterfly)
