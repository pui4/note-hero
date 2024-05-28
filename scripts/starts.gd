extends Node

var node_g = preload("res://assets/note_g.tscn")
var node_b = preload("res://assets/note_b.tscn")
var node_r = preload("res://assets/note_r.tscn")
var node_o = preload("res://assets/note_o.tscn")
var node_y = preload("res://assets/note_y.tscn")

@onready var p_1 = $"1"
@onready var p_2 = $"2"
@onready var p_3 = $"3"
@onready var p_4 = $"4"
@onready var p_5 = $"5"

@onready var t_1 = $"1/Timer"
@onready var t_2 = $"2/Timer"
@onready var t_3 = $"3/Timer"
@onready var t_4 = $"4/Timer"
@onready var t_5 = $"5/Timer"

var c_1 = true
var c_2 = true
var c_3 = true
var c_4 = true
var c_5 = true

func _on_spawner_body_entered(body):
	if body.name != "Player":
		var num = randi_range(1, 5)
		
		find(num)

func find(num):
	match num:
		1:
			if c_1:
				var node = node_g.instantiate()
				p_1.add_child(node)
				t_1.start(1 - Lib.s_rate)
				c_1 = false
			else:
				find(randi_range(1, 5))
		2:
			if c_2:
				var node = node_r.instantiate()
				p_2.add_child(node)
				t_2.start(1 - Lib.s_rate)
				c_2 = false
			else:
				find(randi_range(1, 5))
		3:
			if c_3:
				var node = node_y.instantiate()
				p_3.add_child(node)
				t_3.start(1 - Lib.s_rate)
				c_3 = false
			else:
				find(randi_range(1, 5))
		4:
			if c_4:
				var node = node_b.instantiate()
				p_4.add_child(node)
				t_4.start(1 - Lib.s_rate)
				c_4 = false
			else:
				find(randi_range(1, 5))
		5:
			if c_5:
				var node = node_o.instantiate()
				p_5.add_child(node)
				t_5.start(1 - Lib.s_rate)
				c_5 = false
			else:
				find(randi_range(1, 5))

func one_on_timer_timeout():
	c_1 = true

func two_on_timer_timeout():
	c_2 = true

func three_on_timer_timeout():
	c_3 = true

func four_on_timer_timeout():
	c_4 = true

func five_on_timer_timeout():
	c_5 = true
