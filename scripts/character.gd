class_name Character
extends CharacterBody2D

const LEFT_DIRECTION = -1

const SPEED = 300.0
const JUMP_VELOCITY = -1000.0
const FRICTION = 20.0

var _can_move := true
var _state := "stand"

@onready var _audio: Audio = AudioScene
@onready var _sprite: AnimatedSprite2D = $Sprite


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		_state = "fall"
		velocity += get_gravity() * 2 * delta

		if velocity.y > 0.0:
			_sprite.play("fall")
		else:
			_sprite.play("jump")
	else:
		if _state == "fall":
			_state = "land"
			_sprite.play("land", 2.0)
			await _sprite.animation_looped
			_state = "stand"

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		_audio.play_jump()
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if !_can_move:
		pass
	elif direction:
		_sprite.flip_h = (direction == LEFT_DIRECTION)

		if _state == "stand":
			_sprite.play("walk")

		velocity.x = direction * SPEED
	else:
		if _state == "stand":
			_sprite.play("idle")
		velocity.x = move_toward(velocity.x, 0, FRICTION)

	move_and_slide()


func apply_knock_back() -> void:
	_can_move = false

	velocity = Vector2(-200, -300)
	await get_tree().create_timer(0.5).timeout
	_can_move = true
