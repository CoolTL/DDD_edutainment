extends TextureRect

signal correct

func _ready() -> void:
	var spots = get_tree().get_nodes_in_group("spots")
	for spot in spots:
		spot.connect("changed", check)

# This function is where we define the correct configuration of the frame
func check():
	if $char_spot/ColorRect.visible:
		correct.emit()
