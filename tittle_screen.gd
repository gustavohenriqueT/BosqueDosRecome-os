extends Control

@onready var music: AudioStreamPlayer = $Music

func _ready() -> void:
	if music:
		_fade_in_music()


func _on_start_btt_pressed() -> void:
	if music:
		await _fade_out_music("res://Intro.tscn")
	else:
		get_tree().change_scene_to_file("res://Intro.tscn")

func _on_quit_btt_pressed() -> void:
	get_tree().quit()

func _fade_in_music():
	music.volume_db = -40
	music.play()
	var tween = create_tween()
	tween.tween_property(music, "volume_db", -10, 3.5) \
		.set_trans(Tween.TRANS_SINE) \
		.set_ease(Tween.EASE_OUT)

func _fade_out_music(next_scene: String):
	var tween = create_tween()
	tween.tween_property(music, "volume_db", -40, 2.0) \
		.set_trans(Tween.TRANS_SINE) \
		.set_ease(Tween.EASE_IN_OUT)
	await tween.finished
	get_tree().change_scene_to_file(next_scene)
