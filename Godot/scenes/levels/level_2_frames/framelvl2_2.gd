extends Area2D


var solved = false

func hide_background() -> void:
	$TextureRect.hide()

func enable_monitoring() -> void:
	self.monitoring = true

func disable_monitoring() -> void:
	self.monitoring = false
	$TextureRect.disable_spots()

func _on_area_exited(area: Area2D) -> void:
	if area.get_parent().dragging == false:
		if area.get_parent().back_index == 0:
			hide_background()
			$TextureRect.enable_spots()
			$TextureRect.show()
		elif area.get_parent().back_index == 1:
			hide_background()
			$TextureRect.disable_spots()
			$TextureRect.clear_spots()
			solved = false


func _on_texture_rect_correct() -> void:
	solved = true


func _on_texture_rect_not_correct() -> void:
	solved = false
