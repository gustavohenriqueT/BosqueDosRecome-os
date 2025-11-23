extends CanvasLayer

@onready var resume_btn = $PanelContainer/VBoxContainer/ResumeBtn
@onready var quit_btn = $PanelContainer/VBoxContainer/QuitBtn
@onready var volume_slider = $PanelContainer/VBoxContainer/VolumeSlider
@onready var container = $PanelContainer
@onready var fundo = $ColorRect

func _ready():
	visible = false
	get_tree().paused = false
	
	container.pivot_offset = container.size / 2
	
	resume_btn.pressed.connect(_on_resume_pressed)
	quit_btn.pressed.connect(_on_quit_pressed)
	volume_slider.value_changed.connect(_on_volume_changed)
	
	var volume_db = AudioServer.get_bus_volume_db(0)
	volume_slider.value = db_to_linear(volume_db)

func _input(event):
	if event.is_action_pressed("menu"):
		toggle_pause()

func toggle_pause():
	var esta_pausado = !get_tree().paused
	
	if esta_pausado:
		abrir_menu()
	else:
		fechar_menu()

func abrir_menu():
	get_tree().paused = true
	visible = true
	
	container.pivot_offset = container.size / 2
	container.scale = Vector2(0, 0)
	fundo.modulate.a = 0.0
	
	var tween = create_tween().set_parallel(true)
	tween.tween_property(container, "scale", Vector2(1, 1), 0.4).set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
	tween.tween_property(fundo, "modulate:a", 1.0, 0.3)

func fechar_menu():
	var tween = create_tween().set_parallel(true)
	tween.tween_property(container, "scale", Vector2(0, 0), 0.2).set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_IN)
	tween.tween_property(fundo, "modulate:a", 0.0, 0.2)
	
	await tween.finished
	
	visible = false
	get_tree().paused = false

func _on_resume_pressed():
	toggle_pause()

func _on_quit_pressed():
	get_tree().quit()

func _on_volume_changed(value: float):
	var bus_index = AudioServer.get_bus_index("Master")
	
	if value <= 0.01:
		AudioServer.set_bus_mute(bus_index, true)
	else:
		AudioServer.set_bus_mute(bus_index, false)
		AudioServer.set_bus_volume_db(bus_index, linear_to_db(value))
