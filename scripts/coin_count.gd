class_name CoinCountType
extends CanvasLayer

var coin := 0

@onready var label: Label = $Label


func _update_label() -> void:
	label.text = "%04d" % coin


func _ready() -> void:
	_update_label()


func add_coin(value: int) -> void:
	coin += value
	_update_label()
