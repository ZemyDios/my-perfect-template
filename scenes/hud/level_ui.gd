extends Control


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("pause"):
		SceneManager.change_to("pause_menu")


func _on_button_pressed() -> void:
	SceneManager.change_to("main_menu")
