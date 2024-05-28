extends Node

var score = 0
var paused = false
var time = 0
var dead = false
var n_speed = 2

var music = true
var s_rate = 0

func _process(delta):
	if not paused:
		time += delta
