extends Node

var scores_path: String = "user://high_scores.cfg"

signal game_over(player_won: bool)

class Score extends Resource:
  var score: int
  var initials: String

  func _init(score_: int, initials_: String) -> void:
    self.score = score_
    self.initials = initials_

@export var high_scores: Array[Score] = []

func setup_game() -> void:
  # Sets up initial game state when starting a new game
  # Called when the player starts the game from the main menu
  pass

func restart_level() -> void:
  # Restarts the current level from the beginning
  # Called when restarting from the pause menu
  pass