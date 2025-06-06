class_name SceneHandler extends Node

## Last added scene.
var current_scene: Node


## Adds a new scene to the node it should go based on class.
## Sets new scene as current scene.
func add_scene(scene: Node) -> void:
	if scene is Node2D:
		$World2D.add_child(scene)
	elif scene is Node3D:
		$World3D.add_child(scene)
	elif scene is Control:
		$UI.add_child(scene)
	else:
		printerr("Scene type " + str(scene.get_class()) + " is not supported.")
		get_tree().root.add_child(scene)
		return
	current_scene = scene


## Add a Transition as SceneHandler child.
func add_transition(transition: Transition) -> void:
	add_child(transition)


## Clear all scenes and add a new one.
func set_scene(scene: Node, transition: Transition) -> void:
	add_transition(transition)
	transition.play_in()
	await transition.transition_in_finished
	clear_scenes()
	add_scene(scene)
	transition.play_out()
	await transition.transition_out_finished
	transition.queue_free()


## Calls queue_free to all child nodes from World2D, World3D and UI.
func clear_scenes() -> void:
	var remove_child = func(node: Node) -> void:
		for child in node.get_children():
			child.queue_free()

	remove_child.call($UI)
	remove_child.call($World2D)
	remove_child.call($World3D)
