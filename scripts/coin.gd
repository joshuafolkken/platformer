extends ColorRect


func _on_area_body_entered(body: Node2D) -> void:
	if body.name == "Character":
		Audio.get_node("Coin").play()
		queue_free()
