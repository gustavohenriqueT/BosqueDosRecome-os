extends Node2D

var pode_pescar: bool = false

@onready var lumi_ref = $"../CenárioGrama/Lumi"
@onready var visual_pesca = $"../CenárioGrama/Lumi/balao/lixoPesca"
@onready var visual_vara = $"../CenárioGrama/Lumi/balao/varaPesca"

func _process(delta: float) -> void:
	if pode_pescar and Input.is_action_just_pressed("interact"):
		if lumi_ref and lumi_ref.has_node("AuraController"):
			lumi_ref.get_node("AuraController").emit_event("fish_trash")
		
		_realizar_pesca()

func _on_area_alvo_area_entered(area: Area2D) -> void:
	if "lixo" in area.name.to_lower():
		pode_pescar = true

func _on_area_alvo_area_exited(area: Area2D) -> void:
	if "lixo" in area.name.to_lower():
		pode_pescar = false

func _realizar_pesca() -> void:    
	if visual_vara: visual_vara.visible = false
	if visual_pesca: visual_pesca.visible = true
	if visual_pesca: visual_pesca.modulate.a = 1.0
	
	await get_tree().create_timer(3.0).timeout
	
	if visual_pesca: visual_pesca.visible = false
	if visual_vara: visual_vara.visible = true
