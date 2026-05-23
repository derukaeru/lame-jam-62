extends CanvasLayer

signal loading_screen_ready
@onready var animation: AnimationPlayer = $AnimationPlayer
@onready var cover: ColorRect = $cover

func _ready() -> void:
	animation.play("fade")
	
	var tw = get_tree().create_tween()
	tw.tween_method(transition, 0.0, 0.5, 0.5)
	
	await animation.animation_finished
	loading_screen_ready.emit()

func _on_progress_changed(_value) -> void:
	pass

func _on_loading_finished() -> void:
	animation.play_backwards("fade")
	
	var tw = get_tree().create_tween()
	tw.tween_method(transition, 0.5, 1.0, 0.5)
	
	await animation.animation_finished
	queue_free()

func transition(value: float) -> void:
	cover.material.set_shader_parameter(
		"progress",
		value
	)
	cover.material.set_shader_parameter(
		"background_threshold",
		abs(1.0 - value*2.0) - 0.5
	)
	cover.material.set_shader_parameter(
		"color_threshold",
		min(1.0,abs(-4.0+value*8.0)) * 0.48
	)
