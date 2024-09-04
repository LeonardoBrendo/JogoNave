extends KinematicBody2D
###
var speed = 200
var vel = Vector2()
var combustivel = 100

var balap = preload("res://Laser.tscn")
var lado = 1

signal morreu

onready var ui = get_node("/root/Main/HUD")
onready var alvo = get_node("/root/Main/Player")

func _ready():
	$AnimatedSprite.play()
	alvo.position.x = 2000
	
func _physics_process(delta):
	vel.x = 0
	vel.y = 0
	
	if Input.is_action_pressed("ui_up"):
		vel.y -= speed
	if Input.is_action_pressed("ui_down"):
		vel.y += speed
	if Input.is_action_pressed("ui_right") and alvo.position.x < 3674:
		vel.x += speed
		lado = 1
	if Input.is_action_pressed("ui_left") and alvo.position.x > 365:
		vel.x -= speed
		lado = -1
	
	##momento 2
	if Input.is_action_just_pressed("atira"):
		$atira.play()
		var novabala = balap.instance()
		novabala.position.x = position.x+4
		novabala.position.y = position.y+4
		novabala.z_index = -1
		novabala.setlado(lado)
		get_tree().current_scene.add_child(novabala)
	##momento 2	
			
		
	vel = move_and_slide(vel, Vector2.UP)
	
	if vel.x < 0:
		$AnimatedSprite.flip_h = true
	elif vel.x > 0:
		$AnimatedSprite.flip_h = false
		
		
func morre():
	emit_signal("morreu")
	$AnimatedSprite.stop()
	
func tomadano():
	combustivel -= 10
	if combustivel <= 0:
		morre()
	ui.alteracombustivel(combustivel)
		
func salva():
	ui.tomaponto()
	
func carrega():
	combustivel += 10
	ui.alteracombustivel(combustivel)

	
	
