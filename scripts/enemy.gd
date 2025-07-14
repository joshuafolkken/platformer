extends CharacterBody2D

@export var move_speed: int = 75
@export var can_tread: bool = false


func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta

	velocity.x = -move_speed

	move_and_slide()


func _is_treaded_by_character(body: Node2D) -> bool:
	if not can_tread:
		return false

	if body.name != "Character":
		return false

	return true


func _on_area_2d_body_entered(body: Node2D) -> void:
	if _is_treaded_by_character(body):
		Audio.get_node("Hit").play()
		queue_free()
