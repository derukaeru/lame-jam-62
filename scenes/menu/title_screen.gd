extends Control

func _process(delta):
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		SceneChanger.change_scene("main")
