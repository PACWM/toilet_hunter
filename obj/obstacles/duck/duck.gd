extends CharacterBody2D

const SPEED := 300.0
const JUMP_VELOCITY := -400.0
const MIN_SWITCH_TIME := 5.0
const MAX_SWITCH_TIME := 10.0

var move_direction := -1 # Start moving left
var switch_timer := 0.0
var next_switch_time := 0.0

@onready var sprite_2d: Sprite2D = $Sprite2D

func _ready() -> void:
	_set_next_switch_time()

func _physics_process(delta: float) -> void:
	# Move left or right
	velocity.x = move_direction * SPEED

	move_and_slide()

	# Timer for switching direction
	switch_timer += delta
	if switch_timer >= next_switch_time:
		switch_timer = 0.0
		move_direction *= -1 # Reverse direction
		_set_next_switch_time()
	
	if move_direction == -1:
		sprite_2d.flip_h = true
	else:
		sprite_2d.flip_h = false

func _set_next_switch_time() -> void:
	next_switch_time = randf_range(MIN_SWITCH_TIME, MAX_SWITCH_TIME)


func _on_area_2d_body_entered(body):
	if body is Player:
		# Small knockback, mostly horizontal, very 
		body.knockback(Vector2(-0.5, -0.1), 1750)
