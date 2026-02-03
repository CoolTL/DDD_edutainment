extends TextureRect

signal correct
signal not_correct

@onready var spots = get_tree().get_nodes_in_group("spots")

func _ready() -> void:
	for spot in spots:
		spot.connect("changed", check)

# This function is where we define the correct configuration of the frame
func check():
	if $char_spot/Label.text == $char_spot.correct_msg and $char_spot2/Label.text == $char_spot2.correct_msg:
		correct.emit()
	else:
		not_correct.emit()

func enable_spots() -> void:
	for spot in spots:
		spot.monitoring = true

func disable_spots() -> void:
	for spot in spots:
		spot.monitoring = false

func clear_spots() -> void:
	# Used when background is erased
	for spot in spots:
		spot.clear_spot()
