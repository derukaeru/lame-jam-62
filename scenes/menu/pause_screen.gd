extends Control

func _on_resume_pressed() -> void:
	get_tree().paused = false
	hide()

func _on_exit_pressed() -> void:
	get_tree().paused = false
	hide()
	SceneChanger.change_scene("title_screen")
