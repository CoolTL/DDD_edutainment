extends Area2D


var solved = false
@export var needed_items = 4

func hide_background() -> void:
	$TextureRect.hide()

func show_background() -> void:
	$TextureRect.show()
	$TextureRect.enable_spots()

func enable_monitoring() -> void:
	self.monitoring = true

func disable_monitoring() -> void:
	self.monitoring = false
	$TextureRect.disable_spots()


func _on_texture_rect_correct() -> void:
	solved = true


func _on_texture_rect_not_correct() -> void:
	solved = false
