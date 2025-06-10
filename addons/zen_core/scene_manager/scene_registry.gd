extends Node

var _scenes: Dictionary[String, SceneEntry] = {}


## Register a new scene in scenes dictionary.
func register_scene(id: String, path: String, config: Dictionary = {}) -> void:
	if _scenes.has(id):
		push_warning("Scene '%s' already registered. Overwriting..." % id)

	var entry = SceneEntry.new()

	entry.id = id
	entry.path = path

	for key in config:
		entry.set(key, config[key])

	_scenes[id] = entry
	if entry.preload_scene:
		load(entry.path)


func get_scene_instance(id: String) -> Node:
	if not _scenes.has(id):
		push_error("Scene '%s' not found!" % id)
		return

	var entry := _scenes[id]
	if entry.instance:
		return entry.instance

	entry.instance = load(entry.path).instantiate()
	var instance = entry.instance

	instance.set_meta("id", entry.id)
	instance.set_meta("scene_type", entry.scene_type)
	instance.set_meta("dispose_policy", entry.dispose_policy)
	instance.set_meta("transition", entry.transition)
	instance.set_meta("flags", entry.flags)
	instance.set_meta("context", entry.context)

	return entry.instance


## Returns true if scene id exists.
func is_registered(id: String) -> bool:
	return _scenes.has(id)


## Erase an entry from the scenes dictionary.
func erase_scene(id: String) -> void:
	if _scenes.has(id):
		_scenes.erase(id)


class SceneEntry:
	var id: String
	var path: StringName
	var scene_type: String = SceneConstants.TYPE_MAIN
	var dispose_policy: String = SceneConstants.POLICY_QUEUE_FREE
	var transition: String = ""
	var flags: Dictionary = {}
	var context: Dictionary = {}
	var preload_scene: bool = false
	var instance: Node = null
