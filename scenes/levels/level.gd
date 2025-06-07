extends Node2D


func _on_button_pressed() -> void:
	SceneManager.change_scene_to("res://scenes/ui/main_menu.tscn", "fade")
