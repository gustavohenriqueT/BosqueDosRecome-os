extends CharacterBody2D

var gravidade = 900.0
var forca_pulo = -250.0
var velocidade_movimento = 100.0

@onready var anim = $AnimatedSprite2D
@onready var timer = $Timer

func _ready():
	scale = Vector2(0, 0)
	modulate.a = 0.0
	
	var tween = create_tween()
	tween.parallel().tween_property(self, "scale", Vector2(1, 1), 0.5).set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
	tween.parallel().tween_property(self, "modulate:a", 1.0, 0.3)

	randomize()
	timer.connect("timeout", Callable(self, "_on_timer_timeout"))
	anim.play("idle")
	timer.start(randf_range(0.2, 3.0))

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravidade * delta
		anim.play("jump")
	else:
		if velocity.y >= 0:
			velocity.x = 0
			anim.play("idle")
	
	move_and_slide()

func _on_timer_timeout():
	if randf() > 0.2:
		pular()
	
	timer.wait_time = randf_range(1.5, 4.0)
	timer.start()

func pular():
	if not is_on_floor(): return
	
	var direcao = 1 if randf() > 0.5 else -1
	anim.flip_h = (direcao == -1)
	
	var variacao = randf_range(0.8, 1.2)
	
	velocity.y = forca_pulo * variacao
	velocity.x = (velocidade_movimento * variacao) * direcao
