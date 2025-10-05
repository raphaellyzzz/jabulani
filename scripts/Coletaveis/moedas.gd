extends Node2D


func _on_area_2d_body_entered(body: Node2D) -> void:
	if "placeholder_player" in body.name:
		$anim.play("placeholderanimaçãocoletamoeda")
		Global.moedas += 1
		queue_free()
