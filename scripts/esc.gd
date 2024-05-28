extends Control

@onready var settings = $"settings"

func _process(delta):
	if Input.is_action_just_pressed("esc"):
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
		Lib.paused = true
		visible = true

func _on_button_3_pressed():
	get_tree().quit()

func _on_button_pressed():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	Lib.paused = false
	visible = false

func _on_button_2_pressed():
	var men = load("res://menu.tscn")
	var menu = men.instantiate()
	get_tree().root.add_child(menu)
	get_tree().current_scene = menu
	Lib.paused = false
	get_tree().root.get_node("Level").queue_free()

func _on_button_4_pressed():
	settings.visible = true
