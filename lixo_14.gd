extends Area2D

signal lixo_coletado(tipo: String)

@export var tipo: String = "organico"
var lumi_ref: Node2D = null

func _ready():
	connect("body_entered", Callable(self, "_on_body_entered"))
	connect("body_exited", Callable(self, "_on_body_exited"))

func _process(_delta):
	if lumi_ref and Input.is_action_just_pressed("interact"):
		if lumi_ref.has_node("AuraController"):
			lumi_ref.get_node("AuraController").emit_event("pick_trash")
		
		emit_signal("lixo_coletado", tipo)
		queue_free()

func _on_body_entered(body):
	if body.name == "Lumi":
		lumi_ref = body

func _on_body_exited(body):
	if body.name == "Lumi":
		lumi_ref = null
