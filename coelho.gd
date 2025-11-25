extends CharacterBody2D

@onready var anim = $AnimatedSprite2D
@onready var timer = $Timer
@onready var raycast = $RayCast2D

func _ready():
	randomize()
	timer.connect("timeout", Callable(self, "_on_timer_timeout"))
	timer.start(randf_range(2.0, 4.0))
	anim.play("idle")

func _on_timer_timeout():
	decidir_pulo()
	timer.wait_time = randf_range(2.0, 4.0)
	timer.start()

func decidir_pulo():
	var angulo = randf() * TAU 
	var distancia = randf_range(30.0, 60.0) 
	
	var direcao = Vector2(cos(angulo), sin(angulo))
	var destino = position + (direcao * distancia)
	
	if raycast:
		raycast.target_position = direcao * distancia
		raycast.force_raycast_update()
		if raycast.is_colliding():
			return 

	animar_pulo(destino)

func animar_pulo(posicao_final):
	var tempo_pulo = 0.5
	var altura_visual = -20.0
	
	var tween = create_tween()
	
	tween.tween_property(self, "position", posicao_final, tempo_pulo)
	
	tween.parallel().tween_property(anim, "position:y", altura_visual, tempo_pulo / 2).set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_QUAD)
	tween.chain().tween_property(anim, "position:y", 0.0, tempo_pulo / 2).set_ease(Tween.EASE_IN).set_trans(Tween.TRANS_QUAD)

	if anim.sprite_frames.has_animation("jump"):
		anim.play("jump")
	
	await tween.finished
	anim.play("idle")
