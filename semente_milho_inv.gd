extends Sprite2D

func _ready():
	hide()
	$"../SementeMilhoQuantidade".hide()

func _process(delta):
	var label = $"../SementeMilhoQuantidade"

	if Dados.sementeMilho > 0:
		show()
		label.show()
		label.text = str(Dados.sementeMilho)
	else:
		hide()
		label.hide()
