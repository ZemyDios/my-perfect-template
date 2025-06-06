@tool
extends EditorPlugin

const MAIN_SCENE_PATH = "res://addons/zen_core/scene_manager/main.tscn"


func _enable_plugin() -> void:
	# Add Singletons
	add_autoload_singleton("SceneManager", "res://addons/zen_core/scene_manager/scene_manager.gd")

	# Set main.tscn as main scene
	if FileAccess.file_exists(MAIN_SCENE_PATH):
		ProjectSettings.set_setting("application/run/main_scene", MAIN_SCENE_PATH)
		ProjectSettings.save()
		print("[ZEN] - main.tscn set as main scene.")
	else:
		push_error("[ZEN] - main.tscn not found at expected path!")


func _disable_plugin() -> void:
	# Remove singletons
	remove_autoload_singleton("SceneManager")

	# Clear main scene setting
	ProjectSettings.set_setting("application/run/main_scene", null)
	ProjectSettings.save()
	print("[ZEN] - Removed main scene.")
