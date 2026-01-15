extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func hide_background():
	$ColorRect.hide()
	$ColorRect2.hide()

func _on_area_exited(area: Area2D) -> void:
	if area.get_parent().dragging == false:
		if area.get_parent().char_index == 0:
			hide_background()
			$ColorRect.show()
		elif area.get_parent().char_index == 1:
			hide_background()
			print("works")
