extends GutTest

# Tests for GameManager autoload singleton

var game_manager: Node

func before_each():
	# Get the GameManager singleton
	game_manager = GameManager

func test_game_manager_exists():
	assert_not_null(game_manager, "GameManager should exist as an autoload")

func test_game_manager_has_game_over_signal():
	# Test that GameManager has the expected signal
	assert_true(game_manager.has_signal("game_over"), "GameManager should have game_over signal")

func test_game_manager_has_high_scores_array():
	# Test that GameManager has high_scores property
	assert_true(game_manager.has_method("get"), "GameManager should be accessible")
	# Check high_scores property exists
	var has_high_scores = "high_scores" in game_manager
	assert_true(has_high_scores, "GameManager should have high_scores property")

func test_game_manager_setup_game():
	# Test that setup_game method exists and can be called
	assert_true(game_manager.has_method("setup_game"), "GameManager should have setup_game method")
	# Should not throw error when called
	game_manager.setup_game()
	pass_test("setup_game method executed without error")

func test_game_manager_restart_level():
	# Test that restart_level method exists and can be called
	assert_true(game_manager.has_method("restart_level"), "GameManager should have restart_level method")
	# Should not throw error when called
	game_manager.restart_level()
	pass_test("restart_level method executed without error")

func test_score_class_creation():
	# Test the Score inner class
	var score = GameManager.Score.new(100, "ABC")
	assert_not_null(score, "Score object should be created")
	assert_eq(score.score, 100, "Score value should be set correctly")
	assert_eq(score.initials, "ABC", "Initials should be set correctly")