extends CharacterBody2D

@export var _move_speed: int = 75
@export var _can_tread: bool = false

@onready var _audio: Audio = AudioScene
@onready var _ui: UI = UIScene


func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta

	velocity.x = -_move_speed

	move_and_slide()


func _is_character(body: Node2D) -> bool:
	return body.name == "Character"


func _on_area_2d_body_entered(body: Node2D) -> void:
	if not _can_tread:
		return

	if !_is_character(body):
		return

	_ui.heal(10)
	_audio.play_hit()
	queue_free()


func _on_enemy_hit_box_body_entered(body: Node2D) -> void:
	if !_is_character(body):
		return

	(body as Character).apply_knock_back()
	_ui.damage(10)
