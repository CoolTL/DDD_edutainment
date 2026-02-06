extends Area2D

@export var correct_msg = ""


# We use this signal even though we have the check button to make the frame register if its solved or not
signal changed

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func clear_spot():
	$Label.text = ""

func _on_area_exited(area: Area2D) -> void:
	if area.get_parent().dragging == false:
		if area.get_parent().char_index == 0:
			clear_spot()
			$Label.text = "25 skibe sunket"
		elif area.get_parent().char_index == 1:
			clear_spot()
			$Label.text = "28 skibe sunket"
		elif area.get_parent().char_index == 2:
			clear_spot()
			$Label.text = correct_msg
		elif area.get_parent().char_index == 3:
			clear_spot()
			$Label.text = "36 skibe sunket"
		else:
			clear_spot()
		changed.emit()
