#DSL
extends Node

var dsl_parser = preload("res://scripts/aura_dsl_parser.gd").new()
var glow_tool = preload("res://scripts/glow_controller.gd").new() 

var aura := 0
var alvo_visual: Node2D

func _ready():
	dsl_parser.load_rules("res://scripts/aura_control.txt")
	
	var pai = get_parent()
	
	if pai.has_node("AuraCircular"):
		alvo_visual = pai.get_node("AuraCircular")
		print("AuraCircular encontrada e conectada!")
	else:
		print("⚠️ AVISO: AuraCircular não encontrada na Lumi.")

func emit_event(event_name: String):
	var rule = dsl_parser.get_rule(event_name)
	if rule.is_empty(): return

	var aura_str = str(rule["aura"])
	if aura_str.is_valid_int():
		aura += aura_str.to_int()
		print("AURA TOTAL: ", aura)

	apply_glow_effect(rule["glow"])

func apply_glow_effect(effect_name: String):
	if not alvo_visual: return

	match effect_name:
		"glow_blue":   glow_tool.glow_blue(alvo_visual)
		"glow_yellow": glow_tool.glow_yellow(alvo_visual)
		"green_pulse": glow_tool.glow_pulse(alvo_visual)
		"gold_flash":  glow_tool.gold_flash(alvo_visual)
