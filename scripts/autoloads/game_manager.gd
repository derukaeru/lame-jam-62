extends Node

signal submitted(paper: Area2D)
signal rejected(paper: Area2D)

@onready var pause_screen = load(Registry.UID["pause_screen"]).instantiate()

var canvas_layer: CanvasLayer = CanvasLayer.new()

var day: int = 1
var chance: int = 3

var paper_per_day: int = 10
var paper_today: int = 0
var correct_paper: int = 0
var wrong_paper: int = 0

var total_paper_processed: int = 0
var total_correct_paper: int = 0
var total_wrong_paper: int = 0

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

func start_game() -> void:
	if day <= 1:
		spawn_intro()
		await get_tree().create_timer(1.0).timeout
	
	top_z = 1
	await get_tree().create_timer(1.2).timeout
	spawn_guide()
	await get_tree().create_timer(1.0).timeout
	spawn_paper(1.0)
	
	paper_per_day = 10 + ((day - 1) * 2)
	paper_today = 0
	correct_paper = 0
	wrong_paper = 0

#func _process(_d) -> void:
	#if Input.is_action_just_pressed("ui_cancel"):
		#if get_tree().paused:
			#get_tree().paused = false
			#pause_screen.hide()
		#else:
			#get_tree().paused = true
			#pause_screen.show()

func _unhandled_input(event) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and not event.pressed:
		dragging = false
		dragged_paper = null

func spawn_intro() -> void:
	var intro = load(Registry.UID["intro"]).instantiate()
	intro.global_position = Vector2(500.0, -128.0)
	
	Util.get_group_node("papers").add_child(intro)
	
	var tw: Tween = get_tree().create_tween()
	tw.tween_property(intro, "global_position:y", intro.global_position.y + 256.0, 0.7)

func spawn_paper(speed: float = 0.4) -> void:
	var paper = load(Registry.UID["paper"]).instantiate()
	paper.global_position = Vector2(256.0, -205.0)
	
	Util.get_group_node("papers").add_child(paper)
	
	var tw: Tween = get_tree().create_tween()
	tw.tween_property(paper, "global_position:y", paper.global_position.y + 436.0, speed)

func spawn_guide() -> void:
	var guide = load(Registry.UID["guide"]).instantiate()
	guide.global_position = Vector2(500.0, 604.0)
	
	Util.get_group_node("papers").add_child(guide)
	change_guide()
	
	var tw: Tween = get_tree().create_tween()
	tw.tween_property(guide, "global_position:y", guide.global_position.y - 264.0, 0.7)

func change_guide() -> void:
	var texts = Registry.guide[day - 1]
	Util.get_group_node("guide").conditions.text = texts[0]
	Util.get_group_node("guide").back.text = texts[1]

func next_day() -> void:
	day += 1
	
	paper_per_day = 10 + ((day - 1) * 2)
	correct_paper = 0
	wrong_paper = 0
	paper_today = 0

func end_day() -> void:
	await get_tree().create_timer(1.5).timeout
	SceneChanger.change_scene("end_day_screen")

func submitted_paper(paper: Area2D) -> void:
	paper.queue_free()
	
	paper_today += 1
	GameManager.total_paper_processed += 1
	
	if not paper.tainted:
		correct_paper += 1
		GameManager.total_correct_paper += 1
	else:
		GameManager.total_wrong_paper += 1
		wrong_paper += 1
	
	if paper_today >= paper_per_day:
		end_day()
	else:
		spawn_paper()

func rejected_paper(paper: Area2D) -> void:
	paper.queue_free()
	
	paper_today += 1
	GameManager.total_paper_processed += 1
	
	if paper.tainted:
		correct_paper += 1
		total_correct_paper += 1
	else:
		total_wrong_paper += 1
		wrong_paper += 1
	
	if paper_today >= paper_per_day:
		end_day()
	else:
		spawn_paper()
