extends TextureRect

signal correct

func check():
	if $char_spot/ColorRect.visible:
		correct.emit()
