extends Node2D

signal level_completed
signal level_failed

var completed := false


func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventKey and not completed:
		if event.keycode == 87:
			level_completed.emit()
			SceneManager.change_to("win_screen")
			completed = true
		else:
			level_failed.emit()
			SceneManager.change_to("lose_screen")
			completed = true
