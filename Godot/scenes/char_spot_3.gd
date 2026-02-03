extends Area2D

# We use this signal even though we have the check button to make the frame register if its solved or not
signal changed

@export var index = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func clear_spot():
	$Person1.hide()
	$Person2.hide()
	$Paper1.hide()
	$Paper2.hide()

func _on_area_exited(area: Area2D) -> void:
	if area.get_parent().dragging == false:
		if area.get_parent().char_index == 0 and area.get_parent().char_index == index:
			clear_spot()
			$Person1.show()
		if area.get_parent().char_index == 1 and area.get_parent().char_index == index:
			clear_spot()
			$Person2.show()
		if area.get_parent().char_index == 2 and area.get_parent().char_index == index:
			clear_spot()
			$Paper1.show()
		if area.get_parent().char_index == 3 and area.get_parent().char_index == index:
			clear_spot()
			$Paper2.show()
		#elif area.get_parent().char_index == 1:
			#clear_spot()
		changed.emit()
