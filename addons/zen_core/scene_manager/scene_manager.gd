extends Node

@onready var scene_handler: SceneHandler = (
	preload("res://addons/zen_core/scene_manager/scene_handler.tscn").instantiate()
)


func _ready() -> void:
	_bootstrap_scene_handler()
	print("[ZEN] - " + str(self.name) + " loaded.")


func change_scene_to(path: String, transition: String) -> void:
	scene_handler.set_scene(load(path).instantiate(), TransitionRegistry.get_transition(transition))


func add_overlay(scene: Node) -> void:
	scene_handler.add_scene(scene)


func _bootstrap_scene_handler() -> void:
	print("[ZEN] - SceneManager bootstrapping...")

	# Get scene instanciated by engine
	var current_scene := get_tree().current_scene

	# Add scene handler scene to root
	get_tree().root.add_child.call_deferred(scene_handler)

	# Wait SceneHandler to finish
	await get_tree().process_frame

	# Remove original scene
	get_tree().root.remove_child(current_scene)
	# Add original scene inside SceneHandler
	scene_handler.add_scene(current_scene)

	# Assign SceneHandler as current scene
	get_tree().current_scene = scene_handler
