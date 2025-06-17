extends Control


func _on_retry_button_pressed() -> void:
	SceneManager.change_to("level", true)


func _on_main_menu_button_pressed() -> void:
	SceneManager.change_to("main_menu")
