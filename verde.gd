extends Area2D
@export var tipo: String = "plastico"

func _ready():
	connect("body_entered", Callable(self, "_on_body_entered"))

func _on_body_entered(body):
	if body.has_method("entregar_lixo"):
		body.entregar_lixo(tipo)
