extends Node

# GameHandler: Handles bladder, win/lose state

var game_over := false
var game_won := false

var max_bladder := 100.0
var bladder := 0.0
var fill_duration := 60.0 # seconds to fill bladder
var bladder_rate := max_bladder / fill_duration # fills to 100 in 60s

var game_running := false

func _ready():
	reset_game()

func _process(delta):
	if not game_running:
		return

	# Bladder fill (acts as timer)
	bladder += bladder_rate * delta
	if bladder >= max_bladder:
		bladder = max_bladder
		end_game("bladder")

func start_game():
	reset_game()
	game_running = true

func reset_game():
	bladder = 0.0
	game_running = false
	game_over = false
	game_won = false

func end_game(reason):
	game_running = false
	game_over = true

func win_game():
	game_running = false
	game_won = true

# Call this when player reaches the toilet
func on_player_reached_goal():
	win_game()
