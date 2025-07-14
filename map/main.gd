extends Node2D

const LOST = preload("res://obj/end_scree/lost.tscn")
const WIN = preload("res://obj/end_scree/win.tscn")
var done : bool = false

@onready var song: AudioStreamPlayer2D = $player/song

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
			song.playing = false
		if GameHandler.game_won:
			var win = WIN.instantiate()
			add_child(win)
			win.position = $player/Camera2D/Marker2D.global_position 
			win.size = get_viewport().size
			done = true
			song.playing = false
