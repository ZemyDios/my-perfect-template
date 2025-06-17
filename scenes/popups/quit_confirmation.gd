extends Control


func _on_yes_button_pressed() -> void:
	SceneManager.quit()


func _on_no_button_pressed() -> void:
	SceneManager.pop_overlay()
