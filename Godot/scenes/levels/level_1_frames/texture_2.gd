extends TextureRect

signal correct
signal not_correct


func _ready() -> void:
	pass

# This function is where we define the correct configuration of the frame
func check():
	if $CopPin.visible and $AalbPin.visible:
		correct.emit()
	else:
		not_correct.emit()


func _on_cop_pressed() -> void:
	$CopPin.show()
	check()


func _on_aalb_pressed() -> void:
	$AalbPin.show()
	check()
