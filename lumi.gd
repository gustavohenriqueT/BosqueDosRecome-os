extends CharacterBody2D

const SPEED = 80.0
@onready var anim: AnimatedSprite2D = $AnimatedSprite2D
@onready var feedback_label: Label = $FeedbackLabel
@onready var step_player: AudioStreamPlayer = $StepPlayer

var lixo_carregado: String = ""
var aura_points := 0

var terreno_atual := "grama"
var passos_grama: Array[AudioStream] = []
var passos_madeira: Array[AudioStream] = []
var tempo_passos := 0.0
var intervalo_passos := 0.4
var minigame_ativo: bool = false

var glow_sprite: AnimatedSprite2D

func _ready():
	glow_sprite = $AnimatedSprite2D
	glow_sprite.material = ShaderMaterial.new()
	$"../../sistemaPesca/barra".modulate.a = 0
	$"../../sistemaPesca/barra".visible = false
	$balao.modulate.a = 0
	$balao.visible = false
	$balao/lixoPesca.modulate.a = 0
	$balao/lixoPesca.visible = false
	passos_grama = [
		load("res://stepg1.wav"),
		load("res://stepg2.wav")
	]
	passos_madeira = [
		load("res://stepm1.wav"),
		load("res://stepm2.wav")
	]
	
func set_glow_color(color: Color):
	if glow_sprite.material is ShaderMaterial:
		glow_sprite.material.set_shader_parameter("glow_color", color)

func _physics_process(delta: float) -> void:
	if minigame_ativo:
		velocity = Vector2.ZERO
		move_and_slide()
		return

	var direction = Input.get_vector("left", "right", "up", "back")
	
	if Dados.pescar and Input.is_action_pressed("interact"):
		velocity = Vector2.ZERO
		anim.play("fishing")
		$"../../sistemaPesca/barra".visible = true
		$"../../sistemaPesca/barra".modulate.a = 1
	else:
		$"../../sistemaPesca/barra".visible = false
		$"../../sistemaPesca/barra".modulate.a = 0
		
		velocity = direction.normalized() * SPEED
		
		if direction == Vector2.ZERO:
			anim.play("idle")
		else:
			if abs(direction.x) > abs(direction.y):
				if direction.x > 0:
					anim.play("walk_right")
				else:
					anim.play("walk_left")
			else:
				if direction.y > 0:
					anim.play("walk_down")
				else:
					anim.play("walk_up")

	move_and_slide()

	if velocity.length() > 0:
		tempo_passos -= delta
		if tempo_passos <= 0:
			_tocar_passo()
			tempo_passos = intervalo_passos

func _tocar_passo():
	if not step_player:
		return

	var som: AudioStream
	if GameState.terreno_atual == "grama":
		som = passos_grama.pick_random()
	elif GameState.terreno_atual == "madeira":
		som = passos_madeira.pick_random()
	else:
		return

	step_player.stream = som
	step_player.volume_db = -8
	step_player.pitch_scale = randf_range(0.95, 1.05)
	step_player.play()

func coletar_lixo(tipo: String):
	lixo_carregado = tipo
	print("Pegou lixo:", tipo)
	_mostrar_feedback("Pegou lixo: " + tipo.capitalize(), Color.CYAN)

func add_aura(amount: int):
	aura_points += amount
	print("Pontos de aura:", aura_points)

func _mostrar_feedback(texto: String, cor: Color):
	if not feedback_label:
		return

	feedback_label.text = texto
	feedback_label.add_theme_color_override("font_color", cor)
	feedback_label.visible = true
	feedback_label.modulate.a = 1.0
	feedback_label.position = Vector2(0, -40)

	var tween = create_tween()
	tween.parallel().tween_property(feedback_label, "position:y", -70, 1.0).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
	tween.parallel().tween_property(feedback_label, "modulate:a", 0.0, 1.0).set_trans(Tween.TRANS_SINE)
	await tween.finished

	feedback_label.visible = false
	feedback_label.position.y = -40
	feedback_label.modulate.a = 1.0

func _on_porta_casa_body_entered(body: Node2D) -> void:
	if body.name == "Lumi":
		get_tree().call_deferred("change_scene_to_file", "res://inside_house.tscn")

func _on_exit_body_entered(body: Node2D) -> void:
	if body.name == "Lumi":
		get_tree().call_deferred("change_scene_to_file", "res://principal.tscn")

func _on_semente_tomate_body_entered(body: Node2D) -> void:
	Dados.sementeTomate += 1 

func _on_semente_milho_body_entered(body: Node2D) -> void:
	Dados.sementeMilho += 1

func _on_semente_morango_body_entered(body: Node2D) -> void:
	Dados.sementeMorango += 1

func _on_semente_uva_body_entered(body: Node2D) -> void:
	Dados.sementeUva += 1

func _on_pesca_body_entered(body):
	if body.name == "Lumi":
		$"../../sistemaPesca/AnimationPlayer".play("pescando")
		$balao.visible = true
		$balao.modulate.a = 1
		Dados.pescar = true

func _on_pesca_body_exited(body: Node2D) -> void:
	if body.name == "Lumi":
		$"../../sistemaPesca/AnimationPlayer".play("RESET")
		$balao.visible = false
		$"../../sistemaPesca/barra".visible = false
		Dados.pescar = false
