extends Node

var _overlays: Dictionary[String, Dictionary] = {}


## Register a new overlay.
## If overlay already exists it will overwrite it.
func register(name: String, scene: PackedScene) -> void:
	if not scene or name == "":
		push_error("[ZEN] OverlayRegistry: Invalid scene or name.")
		return

	if _overlays.has(name):
		push_warning("[ZEN] OverlayRegistry: Overlay '%s' already exists. Overwriting..." % name)

	_overlays[name] = {"scene": scene, "instance": null}


## Get an instance of the overlay.
## If force_new_instance is true the new instance will overwrite
## the old instance but won't delete it.
func get_overlay(name: String, force_new_instance := false) -> Node:
	if not _overlays.has(name):
		push_error("Overlay '%s' not registered." % name)
		return null

	var data = _overlays[name]
	if not data["instance"] or force_new_instance:
		data["instance"] = data["scene"].instantiate()

	return data["instance"]


## Clears the instance of a target overlay if it isn't inside the tree.
## Clears all the instances if no target provided.
func clear_unused(target := "") -> void:
	var clear_instance := func(name: String) -> void:
		var instance: Node = _overlays["name"]["instance"]
		if instance and not instance.is_inside_tree():
			instance.queue_free()

	if target.is_empty():
		for name in _overlays.keys():
			clear_instance.call(name)
	else:
		clear_instance.call(target)
