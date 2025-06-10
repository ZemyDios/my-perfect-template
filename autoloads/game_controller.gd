extends Node


func _ready() -> void:
	SceneRegistry.register_scene("pause_menu", "res://scenes/ui/pause_menu.tscn", {
		"scene_type": SceneConstants.TYPE_POPUP,
		"dispose_policy": SceneConstants.POLICY_QUEUE_FREE
	})


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("pause"):
		var pause_menu := SceneRegistry.get_scene_instance("pause_menu")
		SceneManager.add_overlay(pause_menu)
