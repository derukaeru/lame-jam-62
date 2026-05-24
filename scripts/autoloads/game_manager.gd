extends Node

@onready var pause_screen = load(Registry.UID["pause_screen"]).instantiate()

var canvas_layer: CanvasLayer = CanvasLayer.new()
var day: int = 5

var dragging: bool = false
var dragged_paper: Area2D

var min_pos: Vector2 = Vector2(32, 32)
var max_pos: Vector2 = Vector2(720 - 16, 512 - 16)

var top_z: int = 1

func _ready() -> void:
	add_child(canvas_layer)
	canvas_layer.layer = 5
	canvas_layer.add_child(pause_screen)
	
	pause_screen.hide()
	process_mode = Node.PROCESS_MODE_ALWAYS
	
	change_guide()

func _process(_d) -> void:
	if Input.is_action_just_pressed("ui_cancel"):
		if get_tree().paused:
			get_tree().paused = false
			pause_screen.hide()
		else:
			get_tree().paused = true
			pause_screen.show()

func _unhandled_input(event) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and not event.pressed:
		dragging = false
		dragged_paper = null

func spawn_paper() -> void:
	pass

func change_guide() -> void:
	var texts = Registry.guide[day]
	Util.get_group_node("guide").condition = texts[0]
	Util.get_group_node("guide").back = texts[1]

func next_day() -> void:
	day += 1
	change_guide()
