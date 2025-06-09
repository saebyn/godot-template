extends Node2D

@onready var game_menu := $GameMenu
@onready var music_player := $MusicAudioStreamPlayer

# Dynamic game scene management
var game_scene: Node2D = null
var game_scene_packed: PackedScene = preload("res://scenes/game.tscn")

func _ready() -> void:
  GameManager.game_over.connect(_on_game_manager_game_over)


func _on_game_manager_game_over(player_won: bool) -> void:
  # Pause the game when game over occurs
  get_tree().paused = true
  # Load the game over screen
  game_menu.show()
  if game_scene:
    game_scene.hide()

func _input(event: InputEvent) -> void:
  if event.is_action_pressed("ui_cancel"):
    # Check if the game is paused
    if is_game_paused():
      # If the game is paused, resume it
      resume_game()
    else:
      # If the game is not paused, pause it
      pause_game()


func is_game_paused() -> bool:
  # Check if the game is paused
  return get_tree().paused


func pause_game() -> void:
  # Only pause if there's an active game scene
  if game_scene:
    game_menu.pause()

func resume_game() -> void:
  # Only unpause if there's an active game scene
  if game_scene:
    game_menu.unpause()


func _on_game_menu_exit_game() -> void:
  # Exit the game
  get_tree().quit()


func _on_game_menu_return_main_menu() -> void:
  # Return to the main menu
  get_tree().paused = true
  game_menu.show()
  
  # Unload the game scene completely
  if game_scene:
    game_scene.queue_free()
    game_scene = null


func _on_game_menu_start_game() -> void:
  # Start the game
  get_tree().paused = false
  # Hide the game menu
  game_menu.hide()
  
  # Load and instantiate the game scene
  if not game_scene:
    game_scene = game_scene_packed.instantiate()
    add_child(game_scene)
  
  # Show the game scene
  game_scene.show()

  # start the music
  music_player.play()

  GameManager.reset_game()


func _on_game_menu_restart_game() -> void:
  print("Restarting game")
  
  # Ensure game scene is loaded before restarting
  if not game_scene:
    game_scene = game_scene_packed.instantiate()
    add_child(game_scene)
    game_scene.show()
  
  GameManager.restart_level()
  resume_game()
