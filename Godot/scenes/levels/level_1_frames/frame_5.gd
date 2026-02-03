extends Area2D


var solved = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

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
