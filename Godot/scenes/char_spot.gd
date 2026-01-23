extends Area2D

# We use this signal even though we have the check button to make the frame register if its solved or not
signal changed

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func clear_spot():
	$ColorRect.hide()
	$ColorRect2.hide()

func _on_area_exited(area: Area2D) -> void:
	if area.get_parent().dragging == false:
		if area.get_parent().char_index == 0:
			clear_spot()
			$ColorRect.show()
		elif area.get_parent().char_index == 1:
			clear_spot()
		changed.emit()
