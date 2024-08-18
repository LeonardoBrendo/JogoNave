extends Area2D


func _ready():
	pass


func _on_Combustvel_body_entered(body):
	if body.name == "Player":
		body.carrega()
		queue_free()
