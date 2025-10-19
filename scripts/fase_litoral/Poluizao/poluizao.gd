extends Node2D

@onready var _anim := $AnimatedSprite2D as AnimatedSprite2D

func _ready() -> void:
	pass
	
func _process(_delta: float) -> void:
	#ataque pilar
	Global.adm = true
	Global.olhos = true
	_anim.play("idle")
	if Global.olhos and Global.adm:
		$"../cabeca_adm".process_mode = Node.PROCESS_MODE_INHERIT
		_anim.play("ataque_pilar")
