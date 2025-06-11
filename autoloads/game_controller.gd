extends Node


func _ready() -> void:
	(
		SceneRegistry
		. register_scene(
			"main_menu",
			"res://scenes/ui/main_menu.tscn",
			{
				"scene_type": SceneConstants.TYPE_MAIN,
				"dispose_policy": SceneConstants.POLICY_QUEUE_FREE,
				"transition": "fade",
				"context": {},
				"flags": {},
			}
		)
	)

	(
		SceneRegistry
		. register_scene(
			"level",
			"res://scenes/levels/level.tscn",
			{
				"scene_type": SceneConstants.TYPE_MAIN,
				"dispose_policy": SceneConstants.POLICY_QUEUE_FREE,
				"transition": "fade",
				"context": {},
				"flags": {},
			}
		)
	)

	SceneRegistry.register_scene(
		"pause_menu",
		"res://scenes/ui/pause_menu.tscn",
		{
			"scene_type": SceneConstants.TYPE_POPUP,
			"dispose_policy": SceneConstants.POLICY_REMOVE_CHILD
		}
	)


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("pause"):
		SceneManager.change_to("pause_menu")
