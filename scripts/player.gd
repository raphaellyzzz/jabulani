extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var knockback_vector := Vector2.ZERO
var direction
var is_hurted := false
@export var player_life := 6
@onready var ray_d := $RayCast2D_D as RayCast2D
@onready var ray_e := $RayCast2D_E as RayCast2D
@onready var anim := $anim as AnimatedSprite2D
@export var atacando := false
@export var agachado := true
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		ataque()
func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta

	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
		anim.scale.x = direction
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		if knockback_vector != Vector2.ZERO:
			velocity = knockback_vector
	_set_state()
	move_and_slide()
	for platforms in get_slide_collision_count():
		var collision = get_slide_collision(platforms)
		if collision.get_collider().has_method("has_collided_with"):
			collision.get_collider().has_collided_with(collision, self)

func _on_hurtbox_body_entered(body: Node2D) -> void:
	if body.is_in_group("pilar"):
		take_damage(Vector2(0, -5000))
	if player_life < 0:
		queue_free()
	else:
		if ray_d.is_colliding():
			take_damage(Vector2(-1200, -1200))
		elif ray_e.is_colliding():
			take_damage(Vector2(1200, -1200))
		elif $RayCast2D_B.is_colliding() and !Global.boss:
			take_damage(Vector2(0, -1200))
		elif $RayCast2D_C.is_colliding():
			take_damage(Vector2(1200, -1200))
func ataque():
	var porradao = $ataque.get_overlapping_areas()
	for area in porradao:
		var parent = area.get_parent()
		parent.vida -= 1
	atacando = true
	anim.play("ataque")
func take_damage(knockback_force := Vector2.ZERO, duration := 0.25):
	player_life -= 1
	if knockback_force != Vector2.ZERO:
		knockback_vector = knockback_force
		var knockback_tween := get_tree().create_tween()
		knockback_tween.parallel().tween_property(self, "knockback_vector", Vector2.ZERO, duration)
		anim.modulate = Color(1,0,0,1)
		knockback_tween.parallel().tween_property(anim, "modulate", Color(1,1,1,1), duration)
	is_hurted = true
	await get_tree().create_timer(.3).timeout
	is_hurted = false
		
func _set_state():
	if !atacando:
		var state = "idle-pre-ataque"
		if Global.boss:
			state = "idle-pos-ataque"
		if !is_on_floor():
			state = "salto"
		elif direction != 0 and is_on_floor():
			state = "correndo"
		if is_hurted:
			state = "hitado"
		if anim.name != state:
			anim.play(state)

func _on_anim_animation_finished() -> void:
	atacando = false
	
