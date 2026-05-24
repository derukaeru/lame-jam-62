extends Area2D

@onready var background: Sprite2D = $background
@onready var flip_btn: Area2D = $background/flip
@onready var unflip_btn: Area2D = $background/unflip

@onready var conditions: Label = $background/conditions
@onready var back: Label = $background/back
@onready var check: Label = $background/check

var dragging:bool = false
var drag_offset: Vector2 = Vector2.ZERO

var raise_time: float = 0.05
var raise_amt: float = 0.02

var flipped: bool = false

func _input_event(_viewport, event, _shape_idx) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if GameManager.dragging and not GameManager.dragged_paper == self: return
			
			dragging = event.pressed
			GameManager.dragging = event.pressed
			
			if dragging:
				GameManager.dragged_paper = self
				drag_offset = event.position
				
				GameManager.top_z += 1
				z_index = GameManager.top_z
				
				var tween = get_tree().create_tween()
				tween.tween_property(background, "position", Vector2(-8, -8), raise_time)
				set_shader_param(Vector2(raise_amt, raise_amt))
				
	elif event is InputEventMouseMotion and dragging:
		var new_position = global_position + event.relative
		
		new_position.x = clamp(new_position.x, GameManager.min_pos.x, GameManager.max_pos.x)
		new_position.y = clamp(new_position.y, GameManager.min_pos.y, GameManager.max_pos.y)
		global_position = new_position

func _unhandled_input(event) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and not event.pressed:
		if GameManager.dragged_paper == self: 
			GameManager.dragging = false
			GameManager.dragged_paper = null
		
		dragging = false
		
		var tween = get_tree().create_tween()
		tween.tween_property(background, "position", Vector2(0, 0), raise_time)
		set_shader_param(Vector2(0, 0))

func set_shader_param(val: Vector2) -> void:
	background.material.set_shader_parameter("shadow_offset", val)

func flip_guide(_v, event, _i):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if flipped:
				flipped = false
				flip_btn.input_pickable = true
				unflip_btn.input_pickable = false
				
				background.texture = load("res://assets/sprites/paper/guide.png")
				conditions.show()
				back.hide()
				check.show()
			else:
				flipped = true
				flip_btn.input_pickable = false
				unflip_btn.input_pickable = true
				background.texture = load("res://assets/sprites/paper/guide_back.png")
				back.show()
				conditions.hide()
				check.hide()
