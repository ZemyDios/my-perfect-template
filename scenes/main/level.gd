extends Node2D

signal level_completed
signal level_failed


func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventKey:
		if event.keycode == 87:
			level_completed.emit()
			SceneManager.change_to("win_screen")
		else:
			level_failed.emit()
			SceneManager.change_to("lose_screen")
