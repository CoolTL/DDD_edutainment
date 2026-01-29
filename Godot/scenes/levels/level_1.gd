extends Node

@export var lives = 3
@export var frame_1_solved = false
@export var frame_2_solved = false
@export var frame_3_solved = false

var heart = preload("res://scenes/heart.tscn")

@onready var hearts = [$Heart]

func _ready() -> void:
	$Frame.enable_monitoring()
	var counter = 0
	for life in lives-1:
		life = heart.instantiate()
		add_child(life)
		life.position = $Heart.position
		life.position.x += (counter + 1) * 34
		hearts.append(life)
		counter += 1
	# For testing purposes we check if we pre-set any frames to solved
	# NOTE Doesn't work yet
	#checker()


func checker() -> void:
	if not frame_1_solved:
		if $Frame.solved:
			print("Frame 1 solved!")
			frame_1_solved = true
			$Frame.disable_monitoring()
			$Frame2.enable_monitoring()
			$Question1.queue_free()
			return
	if not frame_2_solved:
		if $Frame2.solved:
			print("Frame 2 solved!")
			frame_2_solved = true
			$Frame2.disable_monitoring()
			$Frame3.enable_monitoring()
			$Question2.queue_free()
			return
	if not frame_3_solved:
		if $Frame3.solved:
			print("Frame 3 solved!")
			frame_3_solved = true
			$Frame3.disable_monitoring()
			$Question3.queue_free()
			return
	life_lost()


func life_lost() -> void:
	print("Life lost")
	lives -= 1
	if lives <= 0:
		print("Game over")
	else:
		hearts[-1].queue_free()
		hearts.remove_at(-1)


func _on_check_button_pressed() -> void:
	checker()
