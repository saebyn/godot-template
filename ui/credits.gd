extends Control

func exit_credits():
  get_tree().change_scene_to_file("res://scenes/main.tscn")

func _on_timeout():
  exit_credits()

func _input(event: InputEvent) -> void:
  if event is InputEventMouseButton:
    if event.is_pressed():
      exit_credits()
  elif event is InputEventKey:
    exit_credits()