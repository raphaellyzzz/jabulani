extends Node2D

@onready var _anim := $AnimatedSprite2D as AnimatedSprite2D
var state
func _ready() -> void:
	pass
	
func _process(_delta: float) -> void:
	Global.boss = true
	_set_state()
	if Global.olhos and Global.adm:
		await get_tree().create_timer(1.5).timeout
		$"../cabeca_adm".process_mode = Node.PROCESS_MODE_INHERIT
func _set_state():
	#ataque atira()
	if !Global.adm and !Global.morte_adm:
		state = "idle"
	if !Global.olhos and Global.adm and !Global.morte_adm: 
		state = "idle_2"
	if Global.olhos and Global.adm and !Global.morte_adm:
		state = "ataque_pilar"
	if Global.morte_adm:
		state = "morte_adm"
		Global.morte_adm = false
	if _anim.name != state:
		_anim.play(state)
