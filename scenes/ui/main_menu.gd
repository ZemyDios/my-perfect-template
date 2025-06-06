extends Control


func _on_play_button_pressed() -> void:
	SceneManager.change_scene_to(
		"res://scenes/levels/level.tscn", "res://addons/zen_core/transitions/fade_transition.tscn"
	)


func _on_exit_button_pressed() -> void:
	get_tree().quit()


func _on_config_button_pressed() -> void:
	print("TODO: Change Scene to Configuration")
