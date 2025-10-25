extends Control
@onready var contador_moedas: Label = $MarginContainer/moedas_coluna/contador_moedas as Label
@onready var contador_pontos: Label = $MarginContainer/pontos_coluna/contador_pontos as Label
@onready var vidas: Label = $MarginContainer/status_coluna/vidas as Label

func _ready():
	contador_pontos.text = str("%05d" % Global.pontos)
func _process(_delta: float) -> void:
	contador_pontos.text = str("%05d" % Global.pontos)
