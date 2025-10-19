extends CharacterBody2D


const SPEED = 400.0
var direction := -1
@onready var wall_detector := $wall_detector as RayCast2D
@onready var anim := $AnimatedSprite2D as AnimatedSprite2D
func _physics_process(_delta: float) -> void:
	if wall_detector.is_colliding():
		direction *= -1
		wall_detector.scale.x *= -1
	if direction == 1:
		anim.flip_h = true
	else:
		anim.flip_h = false
	velocity.x = direction * SPEED
	move_and_slide()
