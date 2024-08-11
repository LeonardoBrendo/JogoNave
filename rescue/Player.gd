extends KinematicBody2D


var speed = 200
var vel = Vector2()
var combustivel = 100

func _ready():
	$AnimatedSprite.play()
	
func _physics_process(delta):
	vel.x = 0
	vel.y = 0
	
	if Input.is_action_pressed("ui_up"):
		vel.y -= speed
	if Input.is_action_pressed("ui_down"):
		vel.y += speed
	if Input.is_action_pressed("ui_right"):
		vel.x += speed
	if Input.is_action_pressed("ui_left"):
		vel.x -= speed
	
		
	vel = move_and_slide(vel, Vector2.UP)
	
	if vel.x < 0:
		$AnimatedSprite.flip_h = true
	elif vel.x > 0:
		$AnimatedSprite.flip_h = false
		
		
		
