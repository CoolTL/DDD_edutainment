extends TextureRect

signal correct

func _ready() -> void:
	var spots = get_tree().get_nodes_in_group("spots")
	for spot in spots:
		spot.connect("changed", check)

func check():
	if $char_spot/ColorRect.visible:
		print("gex")
		correct.emit()
