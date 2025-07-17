extends Node2D

@onready var _audio: Audio = AudioScene


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_audio.play_bgm()
