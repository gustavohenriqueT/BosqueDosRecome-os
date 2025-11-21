extends Node

func _reset_aura(node: Node2D):
	node.show()
	node.scale = Vector2(1, 1) 
	node.modulate.a = 0.0  

func glow_pulse(node: Node2D):
	if not node: return
	_reset_aura(node)
	var tw = node.create_tween()
	tw.parallel().tween_property(node, "scale", Vector2(1.5, 1.5), 0.5)
	tw.parallel().tween_property(node, "modulate", Color(0.2, 1, 0.2, 0.6), 0.2)
	tw.tween_property(node, "modulate:a", 0.0, 0.5)

func glow_yellow(node: Node2D):
	if not node: return
	_reset_aura(node)
	var tw = node.create_tween()
	tw.parallel().tween_property(node, "scale", Vector2(1.4, 1.4), 0.3)
	tw.parallel().tween_property(node, "modulate", Color(1, 1, 0, 1.0), 0.2)
	tw.tween_property(node, "modulate:a", 0.0, 0.5)

func glow_blue(node: Node2D):
	if not node: return
	_reset_aura(node)

	var tw = node.create_tween()
	tw.tween_property(node, "modulate", Color(0, 0.5, 1, 0.6), 0.2)
	tw.tween_property(node, "scale", Vector2(1.3, 1.3), 0.4)
	tw.tween_property(node, "modulate:a", 0.0, 0.4)

func gold_flash(node: Node2D):
	if not node: return
	_reset_aura(node)

	var tw = node.create_tween()
	node.scale = Vector2(0.5, 0.5)
	
	tw.parallel().tween_property(node, "scale", Vector2(2.0, 2.0), 0.3).set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_BACK)
	tw.parallel().tween_property(node, "modulate", Color(1, 0.8, 0, 0.8), 0.1)
	
	tw.tween_property(node, "modulate:a", 0.0, 0.5)
