extends Node

@onready var scene_handler: SceneHandler


func _ready() -> void:
	_bootstrap_scene_handler()
	print("[ZEN] - " + str(self.name) + " loaded.")


### MAIN SCENE FUNCTIONS


## Change main scene.
func change_to(id: String, force_new_instance := false) -> void:
	if not SceneRegistry.is_registered(id):
		push_error("Scene ID '%s' not found in SceneRegistry." % id)
		return
	var scene := SceneRegistry.get_scene_instance(id, force_new_instance)
	if scene.is_inside_tree():
		push_warning("Scene is already inside the tree.")
		return

	match scene.get_meta("scene_type", null):
		SceneConstants.TYPE_MAIN:
			var actual_scene := scene_handler.get_scene(SceneConstants.TYPE_MAIN)

			if actual_scene == scene:
				push_warning("New scene and actual scene are the same.")
				return

			var transition: Transition
			if scene.has_meta("transition"):
				transition = TransitionRegistry.get_transition(scene.get_meta("transition", ""))
				scene_handler.add_scene(transition)
				transition.play_in()
				await transition.transition_in_finished

			scene_handler.set_main_scene(scene)
			_process_flags(scene)

			if transition:
				transition.play_out()
				await transition.transition_out_finished
				scene_handler.dispose_scene(transition)

		SceneConstants.TYPE_HUD:
			scene_handler.set_hud(scene)
		SceneConstants.TYPE_OVERLAY:
			scene_handler.push_overlay(scene)
		SceneConstants.TYPE_POPUP:
			scene_handler.push_overlay(scene)
		_:
			printerr("Scene has no type.")


## Restarts main scene.
func restart_scene() -> void:
	pass


## Returns to previous main scene, not sure if i should make this function.
func return_to_previous_scene() -> void:
	pass


## Preloads an scene to use it later.
func preload_scene(id: String) -> void:
	pass


## Loads a scene in background.
func load_scene() -> void:
	pass


func pop_overlay(scene: Node = null) -> void:
	scene_handler.pop_overlay(scene)


## Quit the game, this method should take care of saving unsaved data before closing the game.
func quit() -> void:
	get_tree().quit()


## Process a node flags.
func _process_flags(scene: Node) -> void:
	var flags := scene.get_meta("flags", {})
	for flag in flags:
		match flag:
			"hud":
				var hud := SceneRegistry.get_scene_instance(flags["hud"])
				scene_handler.set_hud(hud)


## Bootstrap the SceneHandler to make SceneManager work.
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
