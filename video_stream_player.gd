extends VideoStreamPlayer

func _ready():

	finished.connect(play)
