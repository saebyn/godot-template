extends GutTest

# Integration tests for key game functionality

func test_game_flow_basic():
	# Test basic game flow - can instantiate main scene and access components
	var main_scene = preload("res://scenes/main.tscn")
	var main_instance = main_scene.instantiate()
	
	# Add to scene tree for proper initialization
	add_child(main_instance)
	
	# Check that main components are accessible
	assert_not_null(main_instance.get_node_or_null("GameMenu"), "Main should have GameMenu child")
	assert_not_null(main_instance.get_node_or_null("MusicAudioStreamPlayer"), "Main should have MusicAudioStreamPlayer child")
	
	# Clean up
	main_instance.queue_free()

func test_game_manager_signal_connection():
	# Test that GameManager signals can be connected using Gut's signal watcher
	watch_signals(GameManager)
	
	# Emit the signal
	GameManager.game_over.emit(true)
	
	# Check signal was emitted
	assert_signal_emitted(GameManager, "game_over", "GameManager game_over signal should be emitted")

func test_input_actions_exist():
	# Test that all required input actions are configured
	var required_actions = ["ui_cancel", "move_left", "move_right"]
	
	for action in required_actions:
		assert_true(InputMap.has_action(action), "InputMap should have action: " + action)
		var events = InputMap.action_get_events(action)
		assert_gt(events.size(), 0, "Action should have at least one event: " + action)

func test_autoload_initialization():
	# Test that all autoloads are properly initialized
	assert_not_null(GameManager, "GameManager autoload should be initialized")
	assert_not_null(KeyPersistence, "KeyPersistence autoload should be initialized")
	assert_not_null(MixerPersistence, "MixerPersistence autoload should be initialized")
	
	# Test that they have expected properties/methods
	assert_true(GameManager.has_method("setup_game"), "GameManager should have setup_game method")
	assert_true(GameManager.has_signal("game_over"), "GameManager should have game_over signal")

func test_menu_instantiation_with_signals():
	# Test menu creation and signal setup
	var menu_scene = preload("res://ui/menu.tscn")
	var menu_instance = menu_scene.instantiate()
	add_child(menu_instance)
	
	# Use Gut's signal watcher
	watch_signals(menu_instance)
	
	# Emit the signal
	menu_instance.start_game.emit()
	
	# Check signal was emitted
	assert_signal_emitted(menu_instance, "start_game", "Menu start_game signal should be emitted")
	
	# Clean up
	menu_instance.queue_free()