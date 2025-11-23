extends Control

@onready var lista_texto = $CanvasLayer/FolhaPapel/VBoxContainer/ListaTexto
@onready var banner = $CanvasLayer/BannerConquista
@onready var label_banner = $CanvasLayer/BannerConquista/Label

@onready var sfx_conquista = $SFX_Conquista
@onready var sfx_platina = $SFX_Platina

const META_AURA = 330
var jogo_platinado = false
var fase_colheita = false

var tarefas = {
	"lixo":    {"texto": "Limpar a Área",     "atual": 0, "alvo": 1,  "concluido": false},
	"plantar": {"texto": "Plantar Canteiros", "atual": 0, "alvo": 20, "concluido": false}, 
	"pescar":  {"texto": "Pescar Lixo",       "atual": 0, "alvo": 4,  "concluido": false}
}

func _ready():
	atualizar_lista()
	if banner:
		banner.visible = false 
		banner.position.y = -150 

func progresso_plantacao(acao: String):
	var t = tarefas["plantar"]
	if t["concluido"]: return

	if acao == "plantou" and not fase_colheita:
		t["atual"] += 1
		if t["atual"] >= t["alvo"]:
			fase_colheita = true
			t["atual"] = 0 
			t["texto"] = "Colher Tudo"
		atualizar_lista()

	elif acao == "colheu" and fase_colheita:
		t["atual"] += 1
		if t["atual"] >= t["alvo"]:
			completar_tarefa("plantar")
		else:
			atualizar_lista()

func progresso_missao(id: String):
	if id == "plantar": return 
	if id in tarefas:
		var t = tarefas[id]
		if t["concluido"]: return
		t["atual"] += 1
		if t["atual"] >= t["alvo"]:
			completar_tarefa(id)
		else:
			atualizar_lista()

func completar_tarefa(id: String):
	if id in tarefas:
		tarefas[id]["concluido"] = true
		tarefas[id]["atual"] = tarefas[id]["alvo"]
		atualizar_lista()
		
		match id:
			"lixo":    
				mostrar_conquista("Fascineira da Natureza!")
			"plantar": 
				mostrar_conquista("Dedos Verdes!")
				var sp = get_tree().get_root().find_child("CoelhoSpawner", true, false)
				if sp and sp.has_method("spawnar_coelho"): sp.spawnar_coelho()
			"pescar":  
				mostrar_conquista("Pescadora de Ilusões!")
				var sp = get_tree().get_root().find_child("SapoSpawner", true, false)
				if sp and sp.has_method("spawnar_sapos"): sp.spawnar_sapos()

func atualizar_lista():
	var texto_final = ""
	for id in tarefas:
		var dados = tarefas[id]
		var nome = dados["texto"]
		var atual = dados["atual"]
		var alvo = dados["alvo"]
		var concluido = dados["concluido"]
		
		if concluido:
			texto_final += "[color=gray][s]✅ " + nome + " (Feito)[/s][/color]\n"
		else:
			if alvo > 1:
				texto_final += "[color=#3e2723]⬜ " + nome + " (" + str(atual) + "/" + str(alvo) + ")[/color]\n"
			else:
				texto_final += "[color=#3e2723]⬜ " + nome + "[/color]\n"
	if lista_texto: lista_texto.text = texto_final

func mostrar_conquista(titulo: String, eh_platina: bool = false):
	if not banner: return
	
	if eh_platina:
		if sfx_platina and sfx_platina.stream: sfx_platina.play()
	else:
		if sfx_conquista and sfx_conquista.stream: sfx_conquista.play()
	
	banner.visible = true
	label_banner.text = "🏆 " + titulo
	
	var tween = create_tween()
	tween.tween_property(banner, "position:y", 20.0, 0.5).set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
	tween.tween_interval(3.0)
	tween.tween_property(banner, "position:y", -150.0, 0.5).set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_IN)
	
	await tween.finished
	banner.visible = false

func checar_progresso_aura(aura_atual: int):
	if jogo_platinado: return

	if aura_atual >= META_AURA:        
		jogo_platinado = true
		mostrar_conquista("GUARDIÃ DA FLORESTA (100%)", true)
