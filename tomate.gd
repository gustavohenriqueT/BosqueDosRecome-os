extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	show()
	$AnimatedSprite2D.frame = 0
	await get_tree().create_timer(3.0).timeout
	$AnimatedSprite2D.frame = 1
	await get_tree().create_timer(3.0).timeout
	await get_tree().create_timer(3.0).timeout
	$AnimatedSprite2D.frame = 4
	await get_tree().create_timer(3.0).timeout
	$AnimatedSprite2D.frame = 5

	while $AnimatedSprite2D.frame == 5:
		print("pode colher")
		await get_tree().create_timer(1.0).timeout


func _on_mouse_entered() -> void:
	if $AnimatedSprite2D.frame == 5:
		print("colhido!")
		$AnimatedSprite2D.frame = 0
