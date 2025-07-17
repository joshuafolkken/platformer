class_name Audio
extends Node

@onready var _bgm: AudioStreamPlayer = $BGM
@onready var _jump: AudioStreamPlayer = $Jump
@onready var _hit: AudioStreamPlayer = $Hit
@onready var _coin: AudioStreamPlayer = $Coin
@onready var _damage: AudioStreamPlayer = $Damage
@onready var _heal: AudioStreamPlayer = $Heal


func play_bgm() -> void:
	_bgm.play()


func play_jump() -> void:
	_jump.play()


func play_hit() -> void:
	_hit.play()


func play_coin() -> void:
	_coin.play()


func play_damage() -> void:
	_damage.play()


func play_heal() -> void:
	_heal.play()
