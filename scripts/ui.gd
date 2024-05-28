extends Control

@onready var num = $"Panel/MarginContainer/HBoxContainer/num"
@onready var tim = $"Panel2/MarginContainer/VBoxContainer/num"
@onready var anim = $"AnimationPlayer"

var fade = false

func _ready():
	anim.play("fade_in")
	Lib.paused = true

func _process(_delta):
	num.text = str(Lib.score)
	tim.text = str(snapped(Lib.time, 1))
	
	if Lib.dead and not fade:
		anim.play("fade_out")
		fade = true


func _on_animation_player_animation_finished(anim_name):
	if anim_name == "fade_in":
		Lib.paused = false
	if anim_name == "fade_out":
		Lib.dead = false
		Lib.paused = false
		Lib.time = 0
		fade = false
		Lib.score = 0
		get_tree().reload_current_scene()
