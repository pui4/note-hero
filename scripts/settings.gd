extends Control

# video
func _on_option_button_item_selected(index):
	match index:
		0:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
		1:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
			DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS, false)
		2:
			DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS, true)

func _on_vsync_button_toggled(button_pressed):
	if button_pressed:
		DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_ENABLED)
	else:
		DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_DISABLED)

func _on_v_close_pressed():
	visible = false

# Audio
func _on_volume_slider_value_changed(value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), linear_to_db(value))

func _on_check_music_toggled(button_pressed):
	if button_pressed:
		Lib.music = true
	else:
		Lib.music = false

func _on_a_close_pressed():
	visible = false

# Gameplay
func _on_s_rate_slider_value_changed(value):
	Lib.s_rate = value

func _on_s_speed_value_changed(value):
	Lib.n_speed = value

func _on_g_close_pressed():
	visible = false
