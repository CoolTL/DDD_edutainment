extends Node

@export var lives = 3
@export var frame_1_solved = false
@export var frame_2_solved = false
@export var frame_3_solved = false
@export var frame_4_solved = false
@export var frame_5_solved = false
@export var frame_6_solved = false

@export var frame_1_text = ""
@export var frame_2_text = ""
@export var frame_3_text = ""
@export var frame_4_text = ""
@export var frame_5_text = ""
@export var frame_6_text = ""

var heart = preload("res://scenes/heart.tscn")

@onready var hearts = [$Heart]

func _ready() -> void:
	$Frame.enable_monitoring()
	$Frame.show_background()
	var counter = 0
	for life in lives-1:
		life = heart.instantiate()
		add_child(life)
		life.position = $Heart.position
		life.position.x += (counter + 1) * 34
		hearts.append(life)
		counter += 1
	$Label.text = frame_1_text
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
			$Frame2.show_background()
			$Question1.queue_free()
			$Label.text = frame_2_text
			return
	if not frame_2_solved:
		if $Frame2.solved:
			print("Frame 2 solved!")
			frame_2_solved = true
			$Frame2.disable_monitoring()
			$Frame3.enable_monitoring()
			$Frame3.show_background()
			$Question2.queue_free()
			$Label.text = frame_3_text
			return
	if not frame_3_solved:
		if $Frame3.solved:
			print("Frame 3 solved!")
			frame_3_solved = true
			$Frame3.disable_monitoring()
			$Frame4.enable_monitoring()
			$Frame4.show_background()
			$Question3.queue_free()
			$Label.text = frame_4_text
			return
	if not frame_4_solved:
		if $Frame4.solved:
			print("Frame 4 solved!")
			frame_4_solved = true
			$Frame4.disable_monitoring()
			$Frame5.enable_monitoring()
			$Frame5.show_background()
			$Question4.queue_free()
			$Label.text = frame_5_text
			return
	if not frame_5_solved:
		if $Frame5.solved:
			print("Frame 5 solved!")
			frame_5_solved = true
			$Frame5.disable_monitoring()
			$Frame6.enable_monitoring()
			$Frame6.show_background()
			$Question5.queue_free()
			$Label.text = frame_6_text
			return
	if not frame_6_solved:
		if $Frame6.solved:
			print("Frame 6 solved!")
			frame_6_solved = true
			$Frame6.disable_monitoring()
			return
	life_lost()


func life_lost() -> void:
	print("Life lost")
	lives -= 1
	hearts[-1].queue_free()
	if lives <= 0:
		$GameOver.show()
		print("Game over")
	else:
		
		hearts.remove_at(-1)


func _on_check_button_pressed() -> void:
	checker()
