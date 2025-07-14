extends Node

@export var obstacle_scenes: Array[PackedScene] = []
@export var spawn_interval: float = 2.0 # seconds between spawns
@export var spawn_point_a: Vector2
@export var spawn_point_b: Vector2
@onready var player: Player = $"../player"

var spawn_timer := 0.0

func _process(delta: float) -> void:
	if not GameHandler.game_running:
		return

	spawn_timer += delta
	if spawn_timer >= spawn_interval:
		spawn_timer = 0.0
		spawn_random_obstacle()
	
func spawn_random_obstacle():
	if obstacle_scenes.is_empty():
		return

	var random_index = randi() % obstacle_scenes.size()
	var obstacle = obstacle_scenes[random_index].instantiate()

	var t = randf()
	var spawn_pos = spawn_point_a.lerp(spawn_point_b, t)

	# Assumiamo che la camera segua il player, prendiamo il margine destro visibile
	var camera = get_viewport().get_camera_2d()
	var viewport_size = get_viewport().size
	var camera_right = camera.global_position.x + viewport_size.x * 0.5

	# Assicuriamoci che l'ostacolo sia effettivamente fuori dallo schermo (a destra)
	if not is_position_outside_view(spawn_pos, camera):
		spawn_pos.x = camera_right + get_viewport().size.x + 32 # puoi usare 32 o obstacle.size se noto

	obstacle.position = spawn_pos


	add_child(obstacle)

func is_position_outside_view(pos: Vector2, camera: Camera2D) -> bool:
	var screen_rect = Rect2(
		camera.global_position - get_viewport().size * 0.5,
		get_viewport().size
	)
	return not screen_rect.has_point(pos)
