extends Control


func _on_play_button_pressed() -> void:
	await SceneManager.change_to("level")
	#SceneManager.change_to("level_hud")
	print("called")


func _on_exit_button_pressed() -> void:
	get_tree().quit()


func _on_config_button_pressed() -> void:
	print("TODO: Change Scene to Configuration")
