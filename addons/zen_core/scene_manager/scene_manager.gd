extends Node

const MAIN_SCENE_PATH = preload("res://addons/zen_core/scene_manager/main.tscn")

var scene_handler: SceneHandler


func _ready() -> void:
	print("[ZEN] - SceneManager bootstrapping...")

	# Get scene instanciated by engine
	var current_scene := get_tree().current_scene

	# Instanciate ZEN scene handler
	scene_handler = MAIN_SCENE_PATH.instantiate()
	# Add scene handler scene to root
	get_tree().root.add_child.call_deferred(scene_handler)

	# Wait SceneHandler to finish
	await get_tree().process_frame

	# Remove original scene
	get_tree().root.remove_child(current_scene)
	# Add original scene inside SceneHandler
	scene_handler.add_scene_to_ui(current_scene)

	# Assign SceneHandler as current scene
	get_tree().current_scene = scene_handler
	print(get_tree().current_scene)

	print("[ZEN] - " + str(self.name) + " loaded.")
