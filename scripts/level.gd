extends Node3D

var g_music = preload("res://music/game.mp3")

@onready var player = AudioStreamPlayer.new()

func _ready():
	add_child(player)
	player.stream = g_music
	player.play()

func _process(_delta):
	if Lib.dead:
		player.stop()
	
	if not Lib.music:
		player.stop()
	elif not player.playing:
		player.play()
