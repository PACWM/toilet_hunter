class_name BANANA
extends StaticBody2D



func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Player:
		body.knockback(Vector2(-1, -0.1), 1400.0)
		# Optionally, you can also play a sound or animation here
		print("Player hit by banana!")
	



func _on_area_2d_area_entered(area: Area2D) -> void:
	var body = area.get_parent()
	if body is BANANA:
		body.queue_free()
