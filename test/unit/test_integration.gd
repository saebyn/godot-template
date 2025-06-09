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
	# Test that GameManager signals can be connected
	var signal_received = false
	var test_callback = func(player_won: bool): signal_received = true
	
	# Connect to game_over signal
	GameManager.game_over.connect(test_callback)
	
	# Emit the signal
	GameManager.game_over.emit(true)
	
	# Check signal was received
	assert_true(signal_received, "GameManager game_over signal should be received")
	
	# Disconnect signal
	GameManager.game_over.disconnect(test_callback)

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
	assert_true(GameManager.has_method("reset_game"), "GameManager should have reset_game method")
	assert_true(GameManager.has_signal("game_over"), "GameManager should have game_over signal")

func test_menu_instantiation_with_signals():
	# Test menu creation and signal setup
	var menu_scene = preload("res://ui/menu.tscn")
	var menu_instance = menu_scene.instantiate()
	add_child(menu_instance)
	
	# Test signal connections
	var signal_received = false
	var test_callback = func(): signal_received = true
	
	menu_instance.start_game.connect(test_callback)
	menu_instance.start_game.emit()
	
	assert_true(signal_received, "Menu start_game signal should be emitted and received")
	
	# Clean up
	menu_instance.queue_free()