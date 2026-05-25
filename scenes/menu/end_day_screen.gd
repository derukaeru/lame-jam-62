extends Control

var leaving: bool = true

func _ready():
	await get_tree().create_timer(1.0).timeout
	$paper_processed.show()
	
	await get_tree().create_timer(1.0).timeout
	$paper_processed.text = "Reviewed Paper: " + str(GameManager.paper_today)
	
	await get_tree().create_timer(1.0).timeout
	$paper_correct.show()
	
	await get_tree().create_timer(1.0).timeout
	$paper_correct.text = "Correctly Reviewed: " + str(GameManager.correct_paper)
	
	await get_tree().create_timer(1.0).timeout
	$paper_wrong.show()
	
	await get_tree().create_timer(1.0).timeout
	$paper_wrong.text = "Wrongly Reviewed: " + str(GameManager.wrong_paper)
	
	await get_tree().create_timer(1.0).timeout
	$chances.show()
	
	await get_tree().create_timer(1.0).timeout
	$chances.text = "Chances: " + str(GameManager.chance)
	
	if GameManager.wrong_paper > GameManager.correct_paper:
		GameManager.chance -= 1
		
	await get_tree().create_timer(0.7).timeout
	$chances.text = "Chances: " + str(GameManager.chance)
	
	await get_tree().create_timer(1.0).timeout
	$continue.show()
	leaving = false

func _process(_delta) -> void:
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) and not leaving:
		leaving = true
		
		if GameManager.day >= 8:
			SceneChanger.change_scene("end_day")
		else:
			GameManager.next_day()
			SceneChanger.change_scene("main")
