class_name Player
extends CharacterBody2D


const SPEED = 700.0
const JUMP_VELOCITY = -600.0

var slowed_down := false
var can_move := true
var spicy_buff : bool = false

var get_knocked := true

@onready var dash_cooldown: Timer = $Dash_cooldown
@onready var dash_bar: ProgressBar = $dash_cooldown
@onready var slowed_down_timer: Timer = $slowed_down
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var safe: Timer = $safe
@onready var audio_spicy_fart: AudioStreamPlayer2D = $audio_spicy_fart

func _physics_process(delta: float) -> void:
	if GameHandler.game_running:
		if not is_on_floor():
			velocity += get_gravity() * delta

		if Input.is_action_just_pressed("ui_accept") and is_on_floor():
			velocity.y = JUMP_VELOCITY

		var direction := Input.get_axis("a", "d")

		if can_move:
			if direction:
				velocity.x = velocity.lerp(Vector2(direction, 0) * SPEED, delta * 2).x
			else:
				velocity.x = move_toward(velocity.x, 0, SPEED)

			if Input.is_action_pressed("sprint") and dash_cooldown.time_left == 0 and velocity.x != 0:
				velocity.x = SPEED * 1.5
				dash_cooldown.start()

				if spicy_buff:
					velocity.x *= 2
					velocity.y = JUMP_VELOCITY * 1.5
					audio_spicy_fart.play()

			if slowed_down:
				velocity *= 0.5
				slowed_down_timer.start()
		else:
			velocity.x = SPEED / 2

		# -- Animation Handling --
		if not is_on_floor():
			animated_sprite_2d.play("jump")
		elif direction:
			animated_sprite_2d.play("walking")
		else:
			animated_sprite_2d.play("defeat") # Assuming you have an "idle" animation

		move_and_slide()


func _process(_delta: float) -> void:
	if dash_cooldown.time_left > 0:
		dash_bar.visible = true
		dash_bar.value = dash_cooldown.time_left
	else:
		dash_bar.visible = false


func knockback(direction: Vector2, force: float) -> void:
	if get_knocked:
		# Apply a knockback effect to the player.
		velocity += direction.normalized() * force
		move_and_slide()
		safe.start()
		get_knocked = false


func _on_slowed_down_timeout() -> void:
	slowed_down = false


func _on_safe_timeout() -> void:
	get_knocked = true
