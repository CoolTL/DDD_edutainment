extends Node

@export var lives = 3
@export var frame_1_solved = false
@export var frame_2_solved = false
@export var frame_3_solved = false
@export var frame_4_solved = false


@export var frame_1_text = ""
@export var frame_2_text = ""
@export var frame_3_text = ""
@export var frame_4_text = ""

var heart = preload("res://scenes/heart.tscn")

@onready var hearts = [$Heart]

func _ready() -> void:
	$Frame.enable_monitoring()
	$Frame.show_background()
	update_items($Frame.needed_items)
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

func update_items(num) -> void:
	if num == 4:
		$SceneItem.show()
		$SceneItem2.show()
		$SceneItem3.show()
		$SceneItem4.show()
		$SceneItem.char_index = 0
		$SceneItem2.char_index = 1
		$SceneItem3.char_index = 2
		$SceneItem4.char_index = 3
	elif num == 2:
		$SceneItem.hide()
		$SceneItem2.show()
		$SceneItem3.show()
		$SceneItem4.hide()
		$SceneItem2.char_index = 0
		$SceneItem3.char_index = 1
	elif num == 0:
		$SceneItem.hide()
		$SceneItem2.hide()
		$SceneItem3.hide()
		$SceneItem4.hide()

func checker() -> void:
	if not frame_1_solved:
		if $Frame.solved:
			print("Frame 1 solved!")
			frame_1_solved = true
			$Frame.disable_monitoring()
			$Frame2.enable_monitoring()
			$Frame2.show_background()
			update_items($Frame2.needed_items)
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
			update_items($Frame3.needed_items)
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
			update_items($Frame4.needed_items)
			$Question3.queue_free()
			$Label.text = frame_4_text
			return
	if not frame_4_solved:
		if $Frame4.solved:
			print("Frame 4 solved!")
			frame_4_solved = true
			$Frame4.disable_monitoring()
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


func _on_check_pressed() -> void:
	checker()
