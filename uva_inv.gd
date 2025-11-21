extends Sprite2D

func _ready():
	hide()
	$"../UvaQuantidade".hide()

func _process(delta):
	var label = $"../UvaQuantidade"

	if Dados.uva > 0:
		show()
		label.show()
		label.text = str(Dados.uva)
	else:
		hide()
		label.hide()
