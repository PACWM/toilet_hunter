extends ProgressBar

# Updates the bladder meter UI by syncing with GameHandler's bladder value

func _ready() -> void:
	max_value = GameHandler.max_bladder
	value = GameHandler.bladder

func _process(_delta: float) -> void:
	value = GameHandler.bladder
