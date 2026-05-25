extends Area2D

# IDK WHAT TO CALL TS
var tainted: bool = false
var taint_type: String
var taints: Array = ["club_stamp", "bad_topic", "unnamed_sources", "banned_words", "foreign", "by_reporter"]

var stamps: Array = []

@onready var background: Sprite2D = $background
@onready var title: Label = $background/title
@onready var content: Label = $background/content
@onready var content2: Label = $background/content2

var dragging:bool = false
var drag_offset: Vector2 = Vector2.ZERO

var raise_time: float = 0.05
var raise_amt: float = 0.02

func _ready() -> void:
	tainted = randf_range(0.0, 1.0) > 0.45
	
	if tainted:
		var current_taint_list: Array = taints.slice(0, GameManager.day)
		taint_type = current_taint_list[randi_range(0, len(current_taint_list) - 1)]
		
		var text: Array
		match taint_type:
			"club_stamp":
				text = Registry.papers.clean[randi_range(0, 9)]
				
				add_stamp(0)
				
				if randf_range(0.0, 1.0) > 0.5:
					if GameManager.day >= 3:
						add_stamp(1)
			"bad_topic":
				text = Registry.papers.tainted["bad_topic"][randi_range(0, 2)]
			"unnamed_sources":
				text = Registry.papers.tainted["unnamed_sources"][randi_range(0, 2)]
			"banned_words":
				text = Registry.papers.tainted["banned_words"][randi_range(0, 2)]
			"foreign":
				text = Registry.papers.tainted["foreign"][randi_range(0, 2)]
				
				if (randf_range(0.0, 1.0) > 0.6):
					tainted = false
					add_stamp(2)
			"by_reporter":
				text = Registry.papers.tainted["by_reporter"][randi_range(0, 2)]
		
		if not taint_type == "by_reporter" and GameManager.day >= 6:
			if (randf_range(0.0, 1.0) > 0.7):
				add_stamp(3)
				tainted = false
		
		title.text = text[0]
		content.text = text[1].substr(0, 74)
		content2.text = text[1].substr(74, -1)
		
		if randf_range(0.0, 1.0) > 0.5 and not taint_type == "club_stamp":
			add_stamp(1)
		if randf_range(0.0, 1.0) > 0.5 and not taint_type == "foreign":
			add_stamp(2)
	else:
		var text: Array = Registry.papers.clean[randi_range(0, 9)]
		title.text = text[0]
		content.text = text[1].substr(0, 74)
		content2.text = text[1].substr(74, -1)
		
		if randf_range(0.0, 1.0) > 0.7:
			add_stamp(1)
		if randf_range(0.0, 1.0) > 0.7:
			add_stamp(2)

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

func add_stamp(id: int) -> void:
	match id:
		0:
			var stamp = load(Registry.UID["club_stamp"]).instantiate()
			stamp.position = Vector2(72 + randi_range(-48, 8), -120 + randi_range(0, 64))
			
			background.add_child(stamp)
			stamps.append("club")
		1:
			var stamp = load(Registry.UID["diamond_stamp"]).instantiate()
			stamp.position = Vector2(-80 + randi_range(0, 64), -135 + randi_range(0, 48))
			
			background.add_child(stamp)
			stamps.append("diamond")
		2:
			var stamp = load(Registry.UID["heart_stamp"]).instantiate()
			stamp.position = Vector2(80 + randi_range(-56, 0), 134 + randi_range(-60, 0))
			
			background.add_child(stamp)
			stamps.append("heart")
		3:
			var stamp = load(Registry.UID["spade_stamp"]).instantiate()
			stamp.position = Vector2(34 + randi_range(-56, 0), -16 + randi_range(-48, 64))
			
			background.add_child(stamp)
			stamps.append("spade")


func submit(area) -> void:
	if area.name == "submit":
		var tween: Tween = get_tree().create_tween()
		tween.tween_property(self, "global_position:x", global_position.x + 256, 0.5)
		
		await tween.finished
		GameManager.submitted.emit(self)
	if area.name == "reject":
		var tween = get_tree().create_tween()
		tween.tween_property(self, "global_position:x", global_position.x - 256, 0.5)
		
		await tween.finished
		GameManager.rejected.emit(self)
