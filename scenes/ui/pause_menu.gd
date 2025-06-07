extends Control


func _on_continue_button_pressed() -> void:
	pass  # Replace with function body.


func _on_main_menu_button_pressed() -> void:
	SceneManager.change_scene_to("res://scenes/ui/main_menu.tscn", "fade")
