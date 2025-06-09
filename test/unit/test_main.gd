extends GutTest

# Tests for Main scene script functionality

func test_main_scene_preload():
	# Test that the main scene and game scene can be loaded
	var main_scene = preload("res://scenes/main.tscn")
	assert_not_null(main_scene, "Main scene should be loadable")
	
	var game_scene = preload("res://scenes/game.tscn")
	assert_not_null(game_scene, "Game scene should be loadable")

func test_main_scene_instantiation():
	# Test that main scene can be instantiated
	var main_scene = preload("res://scenes/main.tscn")
	var main_instance = main_scene.instantiate()
	assert_not_null(main_instance, "Main scene should be instantiable")
	
	# Clean up
	main_instance.queue_free()

func test_input_map_has_required_actions():
	# Test that required input actions exist
	assert_true(InputMap.has_action("ui_cancel"), "InputMap should have ui_cancel action")
	assert_true(InputMap.has_action("move_left"), "InputMap should have move_left action")
	assert_true(InputMap.has_action("move_right"), "InputMap should have move_right action")

func test_project_settings():
	# Test basic project settings
	var app_name = ProjectSettings.get_setting("application/config/name")
	assert_not_null(app_name, "Application name should be set in project settings")
	assert_ne(app_name, "", "Application name should not be empty")