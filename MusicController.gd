extends Node

@onready var player: AudioStreamPlayer = AudioStreamPlayer.new()

var playlists := {
	"title_screen": [
		load("res://TittleMusic.wav")
	],
	"principal": [
		load("res://Outside1.wav"),
		load("res://Outside2.wav"),
		load("res://Outside3.wav"),
		load("res://Outside4.wav")
	],
	"inside_house": [
		load("res://InsideHouse.wav")
	],
	"puzzle_area": [
		load("res://Puzzle1.wav")
	]
}

var musica_atual: AudioStream = null
var cena_atual := ""
var fade_tween: Tween

func _ready():
	add_child(player)
	player.autoplay = false
	player.bus = "Music"
	player.finished.connect(_on_musica_terminou)

func tocar_para_cena(nome_cena: String):
	if not playlists.has(nome_cena):
		return
	
	cena_atual = nome_cena
	var nova = playlists[nome_cena].pick_random()

	if musica_atual == nova:
		return

	await _fade_out()
	musica_atual = nova
	player.stream = musica_atual
	player.volume_db = -35
	player.play()
	await _fade_in()

func _fade_in(duration := 3.0):
	if fade_tween: fade_tween.kill()
	fade_tween = create_tween()
	fade_tween.tween_property(player, "volume_db", -10, duration).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
	await fade_tween.finished

func _fade_out(duration := 2.0):
	if fade_tween: fade_tween.kill()
	var tween = create_tween()
	tween.tween_property(player, "volume_db", -40, duration).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
	await tween.finished

func _on_musica_terminou():
	if playlists.has(cena_atual):
		var nova = playlists[cena_atual].pick_random()
		while nova == musica_atual and playlists[cena_atual].size() > 1:
			nova = playlists[cena_atual].pick_random()
		musica_atual = nova
		player.stream = musica_atual
		player.play()
