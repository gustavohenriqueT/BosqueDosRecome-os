extends Area2D
signal lixo_coletado(tipo: String)

@export var tipo: String = "organico"
var player_near := false

func _ready():
	connect("body_entered", Callable(self, "_on_body_entered"))
	connect("body_exited", Callable(self, "_on_body_exited"))

func _process(_delta):
	if player_near and Input.is_action_just_pressed("interact"): # tecla E
		emit_signal("lixo_coletado", tipo)
		queue_free()

func _on_body_entered(body):
	if body.name == "Lumi":
		player_near = true

func _on_body_exited(body):
	if body.name == "Lumi":
		player_near = false
