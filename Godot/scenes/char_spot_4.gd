extends Area2D

# We use this signal even though we have the check button to make the frame register if its solved or not
signal changed

@export var correct_text = ""


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func clear_spot():
	$Label.text = "P. _____"

func _on_area_exited(area: Area2D) -> void:
	if area.get_parent().dragging == false:
		if area.get_parent().char_index == 0:
			clear_spot()
			$Label.text = "P. Borch"
		elif area.get_parent().char_index == 1:
			clear_spot()
			$Label.text = correct_text
		elif area.get_parent().char_index == 2:
			clear_spot()
			$Label.text = "P. Hitler"
		elif area.get_parent().char_index == 3:
			clear_spot()
			$Label.text = "P. Lunch"
		else:
			clear_spot()
		changed.emit()
