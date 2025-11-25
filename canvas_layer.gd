extends CanvasLayer

@onready var orbe = $OrbeAura
@onready var texto_aura = $TextoAura
var lumi_ref = null

func _process(delta):
	if not lumi_ref:
		lumi_ref = get_tree().get_root().find_child("Lumi", true, false)
	
	if lumi_ref and lumi_ref.has_node("AuraController"):
		var aura_atual = lumi_ref.get_node("AuraController").get_aura()
		
		orbe.value = lerp(orbe.value, float(aura_atual), 0.1)
		
		if texto_aura:
			texto_aura.text = str(aura_atual)
