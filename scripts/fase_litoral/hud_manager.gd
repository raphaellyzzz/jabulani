extends Control

@onready var vidas_icon_6: TextureRect = $container/vidas/vidas_icon6 as TextureRect
@onready var vidas_icon_5: TextureRect = $container/vidas/vidas_icon5 as TextureRect
@onready var vidas_icon_3: TextureRect = $container/vidas/vidas_icon3 as TextureRect
@onready var vidas_icon_2: TextureRect = $container/vidas/vidas_icon2 as TextureRect
@onready var vidas_icon: TextureRect = $container/vidas/vidas_icon as TextureRect
@onready var pontos: Label = $container/pontuacao_conteiner/pontos as Label

func _ready() -> void:
	pontos.text = str("%04d" % Global.pontos)

func _process(_delta: float) -> void:
	pontos.text = str("%04d" % Global.pontos)
