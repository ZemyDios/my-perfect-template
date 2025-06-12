extends Control


func _on_play_button_pressed() -> void:
	SceneManager.change_to("level")


func _on_exit_button_pressed() -> void:
	get_tree().quit()


func _on_config_button_pressed() -> void:
	SceneManager.change_to("configuration_menu")
