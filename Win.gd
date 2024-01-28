extends Control

func _on_play_pressed():
	get_tree().change_scene_to_file("res://Scenes/World.tscn")

func _on_options_pressed():
	visible = false
	$"../Control2".visible = true

func _on_quit_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Scenes/Main.tscn")

