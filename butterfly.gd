extends Node2D

@export var speed := 40.0
@export var change_dir_time := 1.5 
@export var max_distance := 600.0 

var direction := Vector2.ZERO
var origin := Vector2.ZERO

@onready var anim: AnimatedSprite2D = $AnimatedSprite2D

func _ready():
	origin = global_position
	anim.play("fly")
	_change_direction()

	var timer = Timer.new()
	timer.wait_time = change_dir_time
	timer.autostart = true
	timer.one_shot = false
	add_child(timer)
	timer.connect("timeout", Callable(self, "_change_direction"))

func _change_direction():
	var angle = randf() * TAU
	direction = Vector2(cos(angle), sin(angle)).normalized()

	speed = randf_range(30.0, 55.0)

func _physics_process(delta):
	global_position += direction * speed * delta

	if global_position.distance_to(origin) > max_distance:
		direction = (origin - global_position).normalized()

	global_position.y += sin(Time.get_ticks_msec() * 0.005) * 10 * delta

	if direction.x != 0:
		scale.x = sign(direction.x)
