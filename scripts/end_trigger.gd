extends Area3D

func _on_body_exited(body):
	if body.name == "Player":
		Lib.death()
