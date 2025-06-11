extends Node

## A global registry for managing scene transition effects.
## Provides functionality for registering, retrieving, and listing available transitions.
## Designed to be used as an Autoload singleton for easy access across systems.

## Internal dictionary storing registered transitions by name
var _transitions: Dictionary[String, PackedScene] = {}

## Default fallback transition if none is found.
var _default := "fade"


func _ready() -> void:
	# Register built-in transitions on startup
	# These should be valid PackedScenes implementing TransitionEffect
	register("fade", preload("res://addons/zen_core/transitions/fade_transition.tscn"))


## Registers a new transition with a unique name
## If the name already exists, it will be overwritten
func register(name: String, scene: PackedScene) -> void:
	if not scene or name == "":
		push_error("[ZEN] TransitionRegistry: Invalid scene or name.")
		return
	if _transitions.has(name):
		push_warning(
			"[ZEN] TransitionRegistry: Transition '%s' already exists. Overwriting..." % name
		)
	_transitions[name] = scene


## Returns an instance of the specified transition
## If not found, falls back to the default transition
func get_transition(name: String = _default) -> Transition:
	if not _transitions.has(name):
		push_warning("[ZEN] TransitionRegistry: Transition '%s' not found. Using default." % name)
		name = _default
	return _transitions[name].instantiate()


## Changes the default transitions if it exists.
## If transition doesn't exists default transition won't change.
func set_default_transition(name: String) -> void:
	if has_transition(name):
		_default = name
	else:
		push_error("[ZEN] TransitionRegistry: Transition '%s' not found." % name)


## Returns an array of all registered transition names
func get_available_transitions() -> Array:
	return _transitions.keys()


## Unregisters a previously registered transition
func unregister(name: String) -> void:
	if _transitions.has(name):
		_transitions.erase(name)


## Checks if a transition with the given name exists
func has_transition(name: String) -> bool:
	return _transitions.has(name)
