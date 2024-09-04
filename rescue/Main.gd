extends Node2D


func _ready():
	$Player.position.x = 2000


func _physics_process(delta):
	$Camera2D.position.x = $Player.position.x
	$Camera2D.position.y = 250
