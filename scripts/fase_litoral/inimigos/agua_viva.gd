extends CharacterBody2D


const SPEED = 300.0
var direction := -1

func _physics_process(_delta: float) -> void:
	velocity.x = direction * SPEED

	move_and_slide()
