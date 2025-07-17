class_name UI
extends CanvasLayer

var _score := 0
var _health := 100

@onready var _audio: Audio = AudioScene
@onready var _health_progress_bar: ProgressBar = $Health
@onready var _score_label: Label = $Score


func _update_score() -> void:
	_score_label.text = "%04d" % _score


func _ready() -> void:
	_update_score()
	_update_health()


func add_score(value: int) -> void:
	_score += value
	_update_score()


func _update_health() -> void:
	_health_progress_bar.value = _health


func _change_health(value: int) -> void:
	_health += value
	_update_health()


func damage(value: int) -> void:
	_audio.play_damage()
	_change_health(-value)


func heal(value: int) -> void:
	_audio.play_heal()
	_change_health(value)
