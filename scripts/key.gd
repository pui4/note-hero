extends Area3D

@onready var anim = $"AnimationPlayer"
@onready var fire = $"Cylinder"

func _on_body_entered(body):
	if body.name != "Player":
		anim.play("press")
		fire.visible = true
		body.queue_free()


func _on_animation_player_animation_finished(anim_name):
	if anim_name == "press":
		fire.visible = false
