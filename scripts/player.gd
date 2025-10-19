extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var pulo := false
@onready var anim := $anim as AnimatedSprite2D
func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta

	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		pulo = true
	elif is_on_floor():
		pulo = false
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
		anim.scale.x = direction
		if !pulo:
			anim.play("correndo")  
	elif pulo:
		anim.play("salto")  
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		anim.play("idle-pre-ataque")

	move_and_slide()


func _on_hurtbox_body_entered(body: Node2D) -> void:
	if body.is_in_group("inimigos"):
		anim.play("hitado")
