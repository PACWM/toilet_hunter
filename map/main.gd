extends Node2D

const LOST = preload("res://obj/end_scree/lost.tscn")
const WIN = preload("res://obj/end_scree/win.tscn")
var done : bool = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GameHandler.start_game()

func _process(delta: float) -> void:
	if !done:
		if GameHandler.game_over:
			var lost = LOST.instantiate()
			add_child(lost)
			lost.position = $player/Camera2D/Marker2D.global_position
			lost.size = get_viewport().size
			done = true
		if GameHandler.game_won:
			var win = WIN.instantiate()
			add_child(win)
			win.position = $player/Camera2D/Marker2D.global_position 
			win.size = get_viewport().size
			done = true
