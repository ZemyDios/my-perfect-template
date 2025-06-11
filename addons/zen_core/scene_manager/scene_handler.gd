class_name SceneHandler extends Node

var active_scenes: Dictionary = {"main": null, "hud": null, "popups": [], "overlays": []}


## Set a new main scene and dispose old main scene.
func set_main_scene(scene: Node) -> void:
	clear_main_scene()
	clear_all_overlays()
	clear_all_popups()
	clear_hud()
	active_scenes["main"] = scene
	add_scene(scene)


## Dispose Main Scene
func clear_main_scene() -> void:
	dispose_scene(active_scenes["main"])
	active_scenes["main"] = null


func set_hud(scene: Control) -> void:
	clear_hud()
	add_scene(scene)
	active_scenes["hud"] = scene


func clear_hud() -> void:
	dispose_scene(active_scenes["hud"])
	active_scenes["hud"] = null


## Add to overlay stack.
func push_overlay(scene: Control) -> void:
	(active_scenes["overlays"] as Array).append(scene)
	add_scene(scene)


## Dispose last overlay.
func pop_overlay(scene: Node = null) -> void:
	if not scene:
		scene = (active_scenes["overlays"] as Array).back()
	dispose_scene(scene)
	(active_scenes["overlays"] as Array).erase(scene)


## Disposes all overlays.
func clear_all_overlays() -> void:
	for overlay in active_scenes["overlays"]:
		dispose_scene(overlay)


func push_popup(scene: Node) -> void:
	add_scene(scene)
	(active_scenes["popups"] as Array).append(scene)


## Dispose a popup.
## Dispose last popup if no scene specified.
func pop_popup(scene: Node = null) -> void:
	if not scene:
		scene = (active_scenes["popups"] as Array).back()
	dispose_scene(scene)
	(active_scenes["popups"] as Array).erase(scene)


## Disposes all popups.
func clear_all_popups() -> void:
	for popup in active_scenes["popups"]:
		dispose_scene(popup)


## Adds a new scene to the node it should go based on class.
func add_scene(scene: Node) -> void:
	if scene is Node2D:
		$World2D.add_child(scene)
	elif scene is Node3D:
		$World3D.add_child(scene)
	elif scene is Control:
		$UI.add_child(scene)
	elif scene is Transition:
		add_child(scene)
	else:
		printerr("Scene type '%s' is not supported." % scene.get_class())
		get_tree().root.add_child(scene)


## Dispose a scene based on its dispose policy.
## By default will be queue_free().
func dispose_scene(scene: Node) -> void:
	if not scene:
		return

	var dispose_policy := scene.get_meta("dispose_policy", SceneConstants.POLICY_QUEUE_FREE)
	match dispose_policy:
		SceneConstants.POLICY_QUEUE_FREE:
			scene.queue_free()
		SceneConstants.POLICY_REMOVE_CHILD:
			scene.reparent(self)
			remove_child(scene)
		SceneConstants.POLICY_HIDE:
			scene.hide()
		SceneConstants.POLICY_PERSISTENT:
			pass
		_:
			scene.queue_free()


## Returns true if there is an active scene of the type asked.
func has_scene(type: String) -> bool:
	return active_scenes.has(type) and active_scenes[type] != null


## Returns scene of the selected type
func get_scene(type: String) -> Node:
	return active_scenes.get(type, null)
