extends Area2D

# This signal makes the level check if everything is correct
# NOTE Currently unused because of check button
signal changed
var solved = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func hide_background():
	$TextureRect.hide()

func _on_area_exited(area: Area2D) -> void:
	if area.get_parent().dragging == false:
		if area.get_parent().back_index == 0:
			hide_background()
			$TextureRect.show()
		elif area.get_parent().back_index == 1:
			hide_background()
		changed.emit()


func _on_texture_rect_correct() -> void:
	solved = true
