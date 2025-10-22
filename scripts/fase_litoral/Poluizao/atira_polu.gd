extends CharacterBody2D
var vida = 10
func _process(_delta: float) -> void:
	if vida == 0:
		Global.olhos = true
		Global.morte_adm = true
		await get_tree().create_timer(0.75).timeout
		Global.adm = true
		queue_free()
