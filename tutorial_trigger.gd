extends Area2D

@export_multiline var texto_explicativo: String = "Escreva aqui o texto sobre a natureza."
var ja_mostrou = false

func _ready():
	connect("body_entered", Callable(self, "_on_body_entered"))

func _on_body_entered(body):
	if body.name == "Lumi" and not ja_mostrou:
		var hud = get_tree().get_root().find_child("HUD_Tasks", true, false)
		if hud:
			hud.mostrar_tutorial(texto_explicativo)
			ja_mostrou = true
