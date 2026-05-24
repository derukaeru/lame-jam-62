extends Node

signal submitted(paper: Area2D)
signal rejected(paper: Area2D)

@onready var pause_screen = load(Registry.UID["pause_screen"]).instantiate()

var canvas_layer: CanvasLayer = CanvasLayer.new()
var day: int = 5
var paper_per_day: int = 10
var paper_today: int = 0

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
	
	submitted.connect(submitted_paper)
	rejected.connect(rejected_paper)

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
	var paper = load(Registry.UID["paper"]).instantiate()
	paper.global_position = Vector2(392, -205)
	
	var tw: Tween = get_tree().create_tween()
	tw.tween_property(paper, "global_position:y", paper.global_position.y + 358, 0.6)

func change_guide() -> void:
	var texts = Registry.guide[day]
	Util.get_group_node("guide").condition.text = texts[0]
	Util.get_group_node("guide").back.text = texts[1]

func next_day() -> void:
	day += 1
	paper_per_day = 10 + (day * 2)
	
	change_guide()

func submitted_paper(paper: Area2D) -> void:
	paper.queue_free()
	paper_today += 1

func rejected_paper(paper: Area2D) -> void:
	paper.queue_free()
	paper_today += 1
