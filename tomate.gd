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
	if lumi_ref and estado == "vazio" and Input.is_action_just_pressed("ui_accept"):
		if lumi_ref.has_node("AuraController"):
			lumi_ref.get_node("AuraController").emit_event("plant")
		plantar_tomate()

	if lumi_ref and estado == "maduro" and Input.is_action_just_pressed("colher"):
		if lumi_ref.has_node("AuraController"):
			lumi_ref.get_node("AuraController").emit_event("harvest")    
		colher_tomate()
		
func _on_body_entered(body: Node2D) -> void:
	if body.name == "Lumi":
		lumi_ref = body

func _on_body_exited(body: Node2D) -> void:
	if body.name == "Lumi":
		lumi_ref = null

func plantar_tomate():

	var hud = get_tree().get_root().find_child("HUD_Tasks", true, false)
	if hud and hud.fase_atual < 2:
		print("Bloqueado! Limpe o lixo primeiro.")
		return

	if Dados.sementeTomate <= 0:
		print("Sem sementes de tomate.")
		return

	estado = "crescendo"
	Dados.sementeTomate -= 1
	
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
	
	await get_tree().create_timer(4.0).timeout
	$AnimatedSprite2D.frame = 5
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

func colher_tomate():
	print("Tomate colhido!")
	Dados.tomate += 1
	emit_signal("colhido")
	queue_free()
