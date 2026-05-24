extends Area2D

# IDK WHAT TO CALL TS
var tainted: bool = false
var has_stamp: bool = false

@onready var background: Sprite2D = $background

var dragging:bool = false
var drag_offset: Vector2 = Vector2.ZERO

var min_pos: Vector2 = Vector2(32, 32)
var max_pos: Vector2 = Vector2(640 - 32, 448 - 32)

var raise_time: float = 0.05
var raise_amt: float = 0.02

func _ready():
	add_stamp()

func _input_event(_viewport, event, _shape_idx) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			dragging = event.pressed
			if dragging:
				drag_offset = event.position
				z_index = 1
				
				var tween = get_tree().create_tween()
				tween.tween_property(background, "position", Vector2(-8, -8), raise_time)
				set_shader_param(Vector2(raise_amt, raise_amt))
				
	elif event is InputEventMouseMotion and dragging:
		var new_position = global_position + event.relative
		
		new_position.x = clamp(new_position.x, min_pos.x, max_pos.x)
		new_position.y = clamp(new_position.y, min_pos.y, max_pos.y)
		global_position = new_position

func _unhandled_input(event) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and not event.pressed:
		dragging = false
		z_index = 0
		
		var tween = get_tree().create_tween()
		tween.tween_property(background, "position", Vector2(0, 0), raise_time)
		set_shader_param(Vector2(0, 0))

func set_shader_param(val: Vector2) -> void:
	background.material.set_shader_parameter("shadow_offset", val)

func add_stamp():
	var stamp = load(Registry.UID["club_stamp"]).instantiate()
	stamp.position = Vector2(66, -72)
	
	background.add_child(stamp)
	has_stamp = true
