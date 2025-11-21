extends Sprite2D

func _ready():
	hide()
	$"../MorangoQuantidade".hide()

func _process(delta):
	var label = $"../MorangoQuantidade"

	if Dados.morango > 0:
		show()
		label.show()
		label.text = str(Dados.morango)
	else:
		hide()
		label.hide()
