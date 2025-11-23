extends Area2D

signal colhido
signal plantado

var lumi_ref: Node2D = null
var aura_dada := false
var estado := "vazio"
@export var aura_reward := 5

func _ready() -> void:
	hide()

func _process(delta: float) -> void:
	if lumi_ref and Input.is_action_just_pressed("ui_accept") and estado == "vazio":
		if lumi_ref.has_node("AuraController"):
			lumi_ref.get_node("AuraController").emit_event("plant")
		plantar_morango()

	if lumi_ref and Input.is_action_just_pressed("colher") and estado == "maduro":
		if lumi_ref.has_node("AuraController"):
			lumi_ref.get_node("AuraController").emit_event("harvest")
		colher_morango()

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Lumi":
		lumi_ref = body

func _on_body_exited(body: Node2D) -> void:
	if body.name == "Lumi":
		lumi_ref = null

func plantar_morango():
	if Dados.sementeMorango <= 0:
		print("Sem sementes de Morango.")
		return

	estado = "crescendo"
	Dados.sementeMorango -= 1
	
	emit_signal("plantado")

	show()
	$AnimatedSprite2D.frame = 0

	await get_tree().create_timer(4.0).timeout
	$AnimatedSprite2D.frame = 1
	
	await get_tree().create_timer(4.0).timeout
	$AnimatedSprite2D.frame = 2
	
	await get_tree().create_timer(4.0).timeout
	$AnimatedSprite2D.frame = 3
	
	await get_tree().create_timer(4.0).timeout
	$AnimatedSprite2D.frame = 4
	
	estado = "maduro"

	_dar_aura()

func _dar_aura():
	if aura_dada:
		return

	aura_dada = true
	Dados.canteiros_concluidos += 1

	if lumi_ref and lumi_ref.has_method("add_aura"):
		lumi_ref.add_aura(aura_reward)
		print("Ganhou", aura_reward, "de aura por plantar aqui.")
	else:
		var player = get_tree().get_root().find_child("Lumi", true, false)
		if player:
			player.add_aura(aura_reward)
			print("Ganhou", aura_reward, "de aura por plantar aqui.")

func colher_morango():
	print("Morango colhido!")
	Dados.morango += 1
	emit_signal("colhido")
	queue_free()
