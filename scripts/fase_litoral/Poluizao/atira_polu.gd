extends CharacterBody2D
var vida = 10
const LIXO = preload("uid://be565oo6n812d")
func _process(_delta: float) -> void:
	if vida <= 0:
		Global.olhos = true
		Global.morte_adm = true
		await get_tree().create_timer(0.75).timeout
		Global.adm = true
		queue_free()

	

func spawn_lixo():
	var new_lixo = LIXO.instantiate()
	add_child(new_lixo) 


func _on_timer_timeout() -> void:
	Global.ataque_lixo = true
	await get_tree().create_timer(0.4).timeout
	spawn_lixo()
	Global.ataque_lixo = false
