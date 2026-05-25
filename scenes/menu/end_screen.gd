extends Control

var leaving: bool = true

func _ready() -> void:
	await get_tree().create_timer(1.0).timeout
	$paper_processed.show()
	
	await get_tree().create_timer(1.0).timeout
	$paper_processed.text = "Reviewed Paper: " + str(GameManager.total_paper_processed)
	
	await get_tree().create_timer(1.0).timeout
	$correct_paper.show()
	
	await get_tree().create_timer(1.0).timeout
	$correct_paper.text = "Correctly Reviewed: " + str(GameManager.total_correct_paper)
	
	await get_tree().create_timer(1.0).timeout
	$wrong_paper.show()
	
	await get_tree().create_timer(1.0).timeout
	$wrong_paper.text = "Wrongly Reviewed: " + str(GameManager.total_wrong_paper)
	
	await get_tree().create_timer(1.0).timeout
	$continue.show()
	
	leaving = false
	
func _process(_delta) -> void:
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) and not leaving:
		leaving = true
		
		GameManager.day = 1
		SceneChanger.change_scene("title_screen")
