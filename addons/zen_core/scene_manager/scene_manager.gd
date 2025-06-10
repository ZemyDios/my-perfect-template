extends Node

@onready var scene_handler: SceneHandler


func _ready() -> void:
	_bootstrap_scene_handler()
	print("[ZEN] - " + str(self.name) + " loaded.")


func change_scene_to(path: String, transition_name: String) -> void:
	var transition := TransitionRegistry.get_transition(transition_name)
	scene_handler.add_scene(transition)
	transition.play_in()
	await transition.transition_in_finished
	scene_handler.set_main_scene(load(path).instantiate())
	transition.play_out()
	await transition.transition_out_finished
	scene_handler.dispose_scene(transition)


func add_overlay(scene: Node) -> void:
	scene_handler.add_scene(scene)


func _bootstrap_scene_handler() -> void:
	print("[ZEN] - SceneManager bootstrapping...")

	scene_handler = preload("res://addons/zen_core/scene_manager/scene_handler.tscn").instantiate()

	# Get scene instanciated by engine
	var current_scene := get_tree().current_scene

	# Add scene handler scene to root
	get_tree().root.add_child.call_deferred(scene_handler)

	# Wait SceneHandler to finish
	await get_tree().process_frame

	# Remove original scene
	get_tree().root.remove_child(current_scene)
	# Add original scene inside SceneHandler
	scene_handler.set_main_scene(current_scene)

	# Assign SceneHandler as current scene
	get_tree().current_scene = scene_handler
