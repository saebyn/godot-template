extends GutTest

# Tests for Menu UI functionality

func test_menu_scene_loading():
	# Test that menu-related scenes can be loaded
	var menu_scene = preload("res://ui/menu.tscn")
	assert_not_null(menu_scene, "Menu scene should be loadable")

func test_menu_instantiation():
	# Test that menu can be instantiated
	var menu_scene = preload("res://ui/menu.tscn")
	var menu_instance = menu_scene.instantiate()
	assert_not_null(menu_instance, "Menu should be instantiable")
	
	# Test basic properties exist
	assert_true(menu_instance.has_signal("restart_game"), "Menu should have restart_game signal")
	assert_true(menu_instance.has_signal("start_game"), "Menu should have start_game signal")
	assert_true(menu_instance.has_signal("return_main_menu"), "Menu should have return_main_menu signal")
	assert_true(menu_instance.has_signal("exit_game"), "Menu should have exit_game signal")
	
	# Clean up
	menu_instance.queue_free()

func test_menu_has_required_methods():
	# Test that menu has required methods
	var menu_scene = preload("res://ui/menu.tscn")
	var menu_instance = menu_scene.instantiate()
	
	assert_true(menu_instance.has_method("pause"), "Menu should have pause method")
	assert_true(menu_instance.has_method("unpause"), "Menu should have unpause method")
	
	# Clean up
	menu_instance.queue_free()