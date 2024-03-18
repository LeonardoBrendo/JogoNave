extends Area2D

var speed = 800
var lado = 1

func _ready():
	pass # Replace with function body.

func setLado(ladonovo):
	lado = ladonovo
	print(lado)
	
func _physics_process(delta):
	if lado > 0:
		position.x += speed * delta
	else:
		position.x -= speed * delta
