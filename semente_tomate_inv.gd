extends Sprite2D

func _ready():
	hide()
	$"../SementeTomateQuantidade".hide()

func _process(delta):
	var label = $"../SementeTomateQuantidade"

	if Dados.sementeTomate > 0:
		show()
		label.show()
		label.text = str(Dados.sementeTomate)
	else:
		hide()
		label.hide()
