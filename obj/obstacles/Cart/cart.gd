extends CharacterBody2D

const SPEED := -300.0 # Negative for leftward movement

func _physics_process(delta: float) -> void:
	velocity.x = SPEED
	move_and_slide()

func _on_body_entered(body):
	if body is Player:
		# Knock the player back to the left and slightly upward
		body.knockback(Vector2(-1, -0.5), 2000)
