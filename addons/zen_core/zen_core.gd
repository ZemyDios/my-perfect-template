@tool
extends EditorPlugin

const SCENE_MANAGER_PATH = "res://addons/zen_core/scene_manager/scene_manager.gd"
const SCENE_REGISTRY_PATH = "res://addons/zen_core/scene_manager/scene_registry.gd"
const SCENE_CONSTANTS_PATH = "res://addons/zen_core/scene_manager/scene_constants.gd"
const TRANSITION_REGISTRY_PATH = "res://addons/zen_core/transitions/transition_registry.gd"
const CONFIGURATION_MANAGER_PATH = "res://addons/zen_core/configuration/configuration_manager.gd"


func _enable_plugin() -> void:
	# Add autoloads
	add_autoload_singleton("SceneManager", SCENE_MANAGER_PATH)
	add_autoload_singleton("SceneRegistry", SCENE_REGISTRY_PATH)
	add_autoload_singleton("SceneConstants", SCENE_CONSTANTS_PATH)
	add_autoload_singleton("TransitionRegistry", TRANSITION_REGISTRY_PATH)
	add_autoload_singleton("ConfigurationManager", CONFIGURATION_MANAGER_PATH)


func _disable_plugin() -> void:
	# Remove autoloads
	remove_autoload_singleton("SceneManager")
	remove_autoload_singleton("SceneRegistry")
	remove_autoload_singleton("SceneConstants")
	remove_autoload_singleton("TransitionRegistry")
	remove_autoload_singleton("ConfigurationManager")
