extends Control

@onready var anim = $"AnimationPlayer"
@onready var fad = $"ColorRect"
@onready var settings = $"settings"
@onready var player = AudioStreamPlayer.new()

var m_music = preload("res://music/menu.mp3")

func _ready():
	add_child(player)
	player.stream = m_music
	player.play()

func _process(_delta):
	if not Lib.music:
		player.stop()
	elif not player.playing:
		player.play()

func _on_button_pressed():
	anim.play("fade_out")
	fad.visible = true

func _on_button_3_pressed():
	get_tree().quit()

func _on_animation_player_animation_finished(anim_name):
	var lev = load("res://level.tscn")
	var leve = lev.instantiate()
	get_tree().root.add_child(leve)
	get_tree().root.get_node("menu").queue_free()
	get_tree().current_scene = leve

func _on_button_2_pressed():
	settings.visible = true
