extends Sprite2D

func _ready():
	hide()
	$"../SementeMorangoQuantidade".hide()

func _process(delta):
	var label = $"../SementeMorangoQuantidade"

	if Dados.sementeMorango > 0:
		show()
		label.show()
		label.text = str(Dados.sementeMorango)
	else:
		hide()
		label.hide()
