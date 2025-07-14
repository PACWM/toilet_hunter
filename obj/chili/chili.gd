extends StaticBody2D

@onready var timer: Timer = $Timer
var interacted : bool = false


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Player and interacted == false and body.spicy_buff == false:
		interacted = true
		visible = false
		timer.start()
		body.spicy_buff = true
		await timer.timeout
		body.spicy_buff = false
		queue_free()
