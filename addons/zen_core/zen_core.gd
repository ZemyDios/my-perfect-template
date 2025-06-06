@tool
extends EditorPlugin


func _enable_plugin() -> void:
	# Add Singletons
	add_autoload_singleton("SceneManager", "res://addons/zen_core/scene_manager/scene_manager.gd")


func _disable_plugin() -> void:
	# Remove singletons
	remove_autoload_singleton("SceneManager")
