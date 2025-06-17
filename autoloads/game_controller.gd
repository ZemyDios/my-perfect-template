extends Node


func _ready() -> void:
	(
		SceneRegistry
		. register_scene(
			"main_menu",
			"res://scenes/main/main_menu.tscn",
			{
				"transition": "fade",
			}
		)
	)

	(
		SceneRegistry
		. register_scene(
			"configuration_menu",
			"res://scenes/main/configuration_menu.tscn",
			{
				"transition": "fade",
			}
		)
	)

	(
		SceneRegistry
		. register_scene(
			"level_select",
			"res://scenes/main/level_select.tscn",
			{
				"transition": "fade",
			}
		)
	)

	(
		SceneRegistry
		. register_scene(
			"level",
			"res://scenes/main/level.tscn",
			{
				"transition": "fade",
				"flags": {"hud": "level_hud"},
			}
		)
	)

	SceneRegistry.register_scene(
		"level_hud",
		"res://scenes/hud/level_ui.tscn",
		{
			"scene_type": SceneConstants.TYPE_HUD,
			"dispose_policy": SceneConstants.POLICY_REMOVE_CHILD
		}
	)

	SceneRegistry.register_scene(
		"pause_menu",
		"res://scenes/popups/pause_menu.tscn",
		{
			"scene_type": SceneConstants.TYPE_POPUP,
			"dispose_policy": SceneConstants.POLICY_REMOVE_CHILD
		}
	)

	SceneRegistry.register_scene(
		"quit_confirmation",
		"res://scenes/popups/quit_confirmation.tscn",
		{
			"scene_type": SceneConstants.TYPE_POPUP,
			"dispose_policy": SceneConstants.POLICY_REMOVE_CHILD
		}
	)

	SceneRegistry.register_scene(
		"win_screen",
		"res://scenes/popups/win_screen.tscn",
		{
			"scene_type": SceneConstants.TYPE_POPUP,
			"dispose_policy": SceneConstants.POLICY_REMOVE_CHILD
		}
	)

	SceneRegistry.register_scene(
		"lose_screen",
		"res://scenes/popups/lose_screen.tscn",
		{
			"scene_type": SceneConstants.TYPE_POPUP,
			"dispose_policy": SceneConstants.POLICY_REMOVE_CHILD
		}
	)
