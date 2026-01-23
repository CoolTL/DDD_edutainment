extends Node

@export var frame_1_solved = false
@export var frame_2_solved = false
@export var frame_3_solved = false

func _ready() -> void:
	# NOTE Currently we don't use this because of the button
	pass
	#var frames = get_tree().get_nodes_in_group("frames")
	#for frame in frames:
		#pass
		#frame.connect("changed", checker)

func checker() -> void:
	#print("Checking...")
	if not frame_1_solved:
		if $Frame.solved:
			print("Frame 1 solved!")
			frame_1_solved = true
			return
	elif not frame_2_solved:
		if $Frame2.solved:
			print("Frame 2 solved!")
			frame_2_solved = true
			return
	elif not frame_3_solved:
		if $Frame3.solved:
			print("Frame 3 solved!")
			frame_3_solved = true
			return
	print("Life lost")


func _on_check_button_pressed() -> void:
	checker()
