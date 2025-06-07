@tool
extends EditorPlugin

const SCENE_MANAGER_PATH = "res://addons/zen_core/scene_manager/scene_manager.gd"
const TRANSITION_REGISTRY_PATH = "res://addons/zen_core/transitions/transition_registry.gd"


func _enable_plugin() -> void:
	# Add Singletons
	add_autoload_singleton("SceneManager", SCENE_MANAGER_PATH)
	add_autoload_singleton("TransitionRegistry", TRANSITION_REGISTRY_PATH)


func _disable_plugin() -> void:
	# Remove singletons
	remove_autoload_singleton("SceneManager")
	remove_autoload_singleton("TransitionRegistry")
