extends Node2D

func _ready() -> void:
	GameState.terreno_atual = "madeira"
	MusicController.tocar_para_cena("inside_house")

func _process(delta: float) -> void:
	pass
