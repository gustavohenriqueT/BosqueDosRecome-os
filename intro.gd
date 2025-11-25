extends Control

@onready var texto_conteudo = $TextoConteudo
@onready var aviso_continuar = $Label

var slides = [
	"[center][font_size=32]O BOSQUE DOS RECOMEÇOS[/font_size]\n\n\n" +
	"A natureza foi esquecida e o lixo invadiu o bosque.\n" +
	"Os espíritos da floresta adormeceram...",
	
	"[center]Você é [color=#76ff03]Lumi[/color].\n\n" +
	"Sua missão é limpar a poluição, plantar novas vidas\n" +
	"e restaurar a Aura do bosque até atingir [color=gold]100%[/color].[/center]",
	
	"[center][font_size=24]CONTROLES[/font_size]\n\n" +
	"[cell][color=yellow] W A S D [/color] ou [color=yellow] Setas [/color] : Movimentar[/cell]\n" +
	"[cell][color=yellow] E [/color] : Interagir (Pegar Lixo, Pescar)[/cell]\n" +
	"[cell][color=yellow] C [/color] : Colher[/cell]\n" +
	"[cell][color=yellow] I[/color] : Abrir Inventário[/cell]\n" +
	"[cell][color=yellow] ESC [/color] : Fechar Inventário[/cell]\n" +
	"[cell][color=yellow] M [/color] : Menu[/cell]\n" +
	"[cell][color=yellow] ESPAÇO [/color] : Plantar[/cell][/center]"
]

var indice_atual = 0

func _ready():
	mostrar_slide()

func _input(event):
	if event.is_action_pressed("ui_accept") or event is InputEventMouseButton and event.pressed:
		avancar()

func mostrar_slide():
	texto_conteudo.text = slides[indice_atual]

	texto_conteudo.modulate.a = 0
	var tween = create_tween()
	tween.tween_property(texto_conteudo, "modulate:a", 1.0, 0.5)

func avancar():
	indice_atual += 1
	
	if indice_atual < slides.size():
		mostrar_slide()
	else:
		iniciar_jogo()

func iniciar_jogo():
	get_tree().change_scene_to_file("res://principal.tscn")
