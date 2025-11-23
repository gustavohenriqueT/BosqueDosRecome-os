extends Node2D

func _ready():
	for canteiro in get_children():
		if canteiro.has_signal("plantado"):
			canteiro.connect("plantado", Callable(self, "_on_canteiro_plantado"))
		
		if canteiro.has_signal("colhido"):
			canteiro.connect("colhido", Callable(self, "_on_canteiro_colhido"))

func _on_canteiro_plantado():
	var hud = get_tree().get_root().find_child("HUD_Tasks", true, false)
	if hud:
		hud.progresso_plantacao("plantou")

func _on_canteiro_colhido():
	var hud = get_tree().get_root().find_child("HUD_Tasks", true, false)
	if hud:
		hud.progresso_plantacao("colheu")
