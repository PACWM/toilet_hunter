extends CharacterBody2D

const SPEED := -60.0 # Very slow leftward movement
@onready var slowed_down: Timer = $slowed_down

func _physics_process(_delta: float) -> void:
	velocity.x = SPEED
	move_and_slide()

func _on_area_2d_body_entered(body):
	if body is Player:
		# Small knockback, mostly horizontal, very annoying!
		body.knockback(Vector2(-0.5, -0.1), 1400)
		# Optionally, you can also slow the player down for a short time
		body.slowed_down = true
		slowed_down.start()
		await slowed_down.timeout
		body.slowed_down = false
