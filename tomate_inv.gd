extends Sprite2D

func _ready():
	hide()
	$"../TomateQuantidade".hide()

func _process(delta):
	var label = $"../TomateQuantidade"

	if Dados.tomate > 0:
		show()
		label.show()
		label.text = str(Dados.tomate)
	else:
		hide()
		label.hide()
