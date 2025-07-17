extends ColorRect

@onready var _ui: UI = UIScene
@onready var _audio: Audio = AudioScene


func _on_area_body_entered(body: Node2D) -> void:
	if body.name != "Character":
		return

	_ui.damage(10)
	_ui.add_score(10)
	_audio.play_coin()
	queue_free()
