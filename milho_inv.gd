extends Sprite2D

func _ready():
	hide()
	$"../MilhoQuantidade".hide()

func _process(delta):
	var label = $"../MilhoQuantidade"

	if Dados.milho > 0:
		show()
		label.show()
		label.text = str(Dados.milho)
	else:
		hide()
		label.hide()
