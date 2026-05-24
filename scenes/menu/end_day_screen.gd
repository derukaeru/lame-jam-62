extends Control

var leaving: bool = false

func _process(_delta) -> void:
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) and not leaving:
		leaving = true
		
		GameManager.next_day()
		SceneChanger.change_scene("main")
