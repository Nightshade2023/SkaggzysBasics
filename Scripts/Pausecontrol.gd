extends Control

func _onready():
	$VBoxContainer/MasterSlider.set_value_no_signal(db_to_linear(AudioServer.get_bus_volume_db(AudioServer.get_bus_index("Master"))))
	$VBoxContainer/MusicSlider.set_value_no_signal(db_to_linear(AudioServer.get_bus_volume_db(AudioServer.get_bus_index("Music"))))
	$VBoxContainer/VoicesSlider.set_value_no_signal(db_to_linear(AudioServer.get_bus_volume_db(AudioServer.get_bus_index("Voices"))))
	$VBoxContainer/SensativitySlider.set_value_no_signal(Gameinfo.mou)

func _on_back_pressed():
	visible = false
	$"../Control".visble = true

func _on_play_pressed():
	get_tree().paused = false
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	visible = false


func _on_master_slider_value_changed(value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), linear_to_db(value))


func _on_music_slider_value_changed(value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Music"), linear_to_db(value))


func _on_voices_slider_value_changed(value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Voices"), linear_to_db(value))


func _on_sensativity_slider_value_changed(value):
	Gameinfo.mouseSensativity = value
