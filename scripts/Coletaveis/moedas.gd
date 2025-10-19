extends Node2D


func _on_area_2d_body_entered(body: Node2D) -> void:
	if "player" in body.name:
		Global.pontos += 15
		queue_free()
