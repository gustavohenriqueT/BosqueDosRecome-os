extends Sprite2D

func _ready():
	hide()
	$"../SementeUvaQuantidade".hide()

func _process(delta):
	var label = $"../SementeUvaQuantidade"

	if Dados.sementeUva > 0:
		show()
		label.show()
		label.text = str(Dados.sementeUva)
	else:
		hide()
		label.hide()
