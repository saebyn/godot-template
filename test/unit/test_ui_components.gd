extends GutTest

# Tests for UI components and utility functions

func test_action_remap_button_functionality():
	# Test that the action remap button scene can be loaded
	var action_remap_scene = preload("res://ui/keybindings/action_remap_button.gd")
	assert_not_null(action_remap_scene, "Action remap button script should be loadable")

func test_high_scores_scene():
	# Test that high scores scene can be loaded
	var high_scores_scene = preload("res://ui/high_scores.tscn")
	assert_not_null(high_scores_scene, "High scores scene should be loadable")
	
	var high_scores_instance = high_scores_scene.instantiate()
	assert_not_null(high_scores_instance, "High scores should be instantiable")
	assert_true(high_scores_instance.has_signal("return_to_menu"), "High scores should have return_to_menu signal")
	
	# Clean up
	high_scores_instance.queue_free()

func test_mixer_scene():
	# Test that mixer scene can be loaded
	var mixer_scene = preload("res://ui/mixer/mixer.tscn")
	assert_not_null(mixer_scene, "Mixer scene should be loadable")
	
	var mixer_instance = mixer_scene.instantiate()
	assert_not_null(mixer_instance, "Mixer should be instantiable")
	
	# Clean up
	mixer_instance.queue_free()

func test_keybindings_scene():
	# Test that keybindings scene can be loaded
	var keybindings_scene = preload("res://ui/keybindings/keybindings.tscn")
	assert_not_null(keybindings_scene, "Keybindings scene should be loadable")

func test_credits_scene():
	# Test that credits scene can be loaded
	var credits_scene = preload("res://ui/credits.tscn")
	assert_not_null(credits_scene, "Credits scene should be loadable")

func test_required_singletons():
	# Test that all autoload singletons exist
	assert_not_null(KeyPersistence, "KeyPersistence singleton should exist")
	assert_not_null(MixerPersistence, "MixerPersistence singleton should exist")
	assert_not_null(GameManager, "GameManager singleton should exist")

func test_theme_loading():
	# Test that the custom theme can be loaded
	var theme = preload("res://theme/theme.tres")
	assert_not_null(theme, "Custom theme should be loadable")

func test_bus_layout():
	# Test that the bus layout can be loaded
	var bus_layout = preload("res://bus_layout.tres")
	assert_not_null(bus_layout, "Bus layout should be loadable")