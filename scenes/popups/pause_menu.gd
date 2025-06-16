extends Control


func _on_continue_button_pressed() -> void:
	SceneManager.pop_overlay(self)


func _on_main_menu_button_pressed() -> void:
	SceneManager.change_to("main_menu")
