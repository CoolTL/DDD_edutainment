extends AnimatedSprite2D

var dragging = false
var of = Vector2(0,0)
var start_pos = 0

@export var char_index = 0

func _ready():
	#print(name, " layer=", $Area2D.collision_layer, " mask=", $Area2D.collision_mask)
	self.frame = char_index
	pass

func update_frame() -> void:
	self.frame = char_index

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if dragging:
		position = get_global_mouse_position() - of
	

func _on_button_button_down() -> void:
	start_pos = global_position
	dragging = true
	of = get_global_mouse_position() - global_position

func _on_button_button_up() -> void:
	dragging = false
	position = start_pos
