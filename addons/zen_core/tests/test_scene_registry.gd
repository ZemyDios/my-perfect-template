extends GutTest


func before_each():
	SceneRegistry._scenes.clear()


func test_register_scene():
	SceneRegistry.register_scene("main", "res://addons/zen_core/tests/mocks/fake_main.tscn")
	assert_true(SceneRegistry.is_registered("main"), "Scene should be registered.")


func test_get_scene_instance():
	SceneRegistry.register_scene("main_level", "res://addons/zen_core/tests/mocks/fake_main.tscn")
	var main_menu := SceneRegistry.get_scene_instance("main_level")

	assert_not_null(main_menu)
	assert_true(main_menu is Node2D)
