extends Node

func _ready() -> void:
	var frames = get_tree().get_nodes_in_group("frames")
	for frame in frames:
		frame.connect("changed", checker)

func checker() -> void:
	print("Checking...")
