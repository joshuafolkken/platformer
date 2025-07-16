extends ColorRect


func _on_area_body_entered(body: Node2D) -> void:
	if body.name == "Character":
		(CoinCount as CoinCountType).add_coin(10)
		(Audio.get_node("Coin") as AudioStreamPlayer).play()
		queue_free()
