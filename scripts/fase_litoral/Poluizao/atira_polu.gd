extends CharacterBody2D
var vida = 10
func _process(_delta: float) -> void:
	if vida == 0:
		Global.olhos = true
		Global.morte_adm = true
		Global.adm = true
		queue_free()
