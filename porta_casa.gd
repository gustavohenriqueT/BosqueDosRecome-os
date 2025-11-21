extends Area2D

@onready var som_porta: AudioStreamPlayer = $AudioStreamPlayer

@export var som_acao: AudioStream 
@export var proxima_cena: String  

func _ready():
	connect("body_entered", Callable(self, "_on_body_entered"))

func _on_body_entered(body):
	if body.name != "Lumi":
		return

	# Toca o som
	if som_acao:
		som_porta.stream = som_acao
		som_porta.volume_db = -6
		som_porta.play()

	# Troca a cena depois de um pequeno delay
	await get_tree().create_timer(0.2).timeout  
	get_tree().change_scene_to_file(proxima_cena)
