extends Node2D

func _ready():
	MusicController.tocar_para_cena("principal")
	GameState.terreno_atual = "grama"


func _on_tomate_body_entered(body: Node2D) -> void:
	pass # Replace with function body.


func _on_lixo_body_exited(body: Node2D) -> void:
	pass # Replace with function body.
