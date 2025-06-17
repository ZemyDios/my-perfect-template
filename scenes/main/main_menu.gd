extends Control


func _on_play_button_pressed() -> void:
	SceneManager.change_to("level_select")


func _on_exit_button_pressed() -> void:
	SceneManager.change_to("quit_confirmation")


func _on_config_button_pressed() -> void:
	SceneManager.change_to("configuration_menu")
