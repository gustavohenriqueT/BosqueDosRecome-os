extends Area2D

func _ready() -> void:
	$Invetario.hide()

func _process(delta: float) -> void:
	pass

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("inventario"):
		$Invetario.show()
	if Input.is_action_just_pressed("closeInvent"):
		$Invetario.hide()
