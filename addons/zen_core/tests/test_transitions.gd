extends GutTest

const FAKE_TRANSITION_SCENE := preload("res://addons/zen_core/transitions/fade_transition.tscn")

var registry = null


func before_each():
	registry = preload("res://addons/zen_core/transitions/transition_registry.gd").new()
	add_child(registry)  # Para que tenga contexto como nodo


func after_each():
	registry.queue_free()
	registry = null


func test_registers_new_transition():
	registry.register("test_fade", FAKE_TRANSITION_SCENE)
	assert_true(registry.has_transition("test_fade"))


func test_registering_existing_transition_overwrites():
	registry.register("dupe", FAKE_TRANSITION_SCENE)
	var original = registry._transitions["dupe"]
	registry.register("dupe", FAKE_TRANSITION_SCENE)
	var overwritten = registry._transitions["dupe"]
	assert_eq(original, overwritten)


func test_get_transition_returns_valid_instance():
	registry.register("fade", FAKE_TRANSITION_SCENE)
	var instance = registry.get_transition("fade")
	assert_not_null(instance)
	assert_true(instance is Transition)


func test_get_transition_returns_default_if_not_found():
	registry.register("fade", FAKE_TRANSITION_SCENE)
	var instance = registry.get_transition("not_registered")
	assert_not_null(instance)
	assert_true(instance is Transition)


func test_unregister_removes_it():
	registry.register("temp", FAKE_TRANSITION_SCENE)
	registry.unregister("temp")
	assert_false(registry.has_transition("temp"))


func test_get_available_transitions_returns_names():
	registry.register("t1", FAKE_TRANSITION_SCENE)
	registry.register("t2", FAKE_TRANSITION_SCENE)
	var names = registry.get_available_transitions()
	assert_has(names, "t1")
	assert_has(names, "t2")
