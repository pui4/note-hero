extends AnimatableBody3D

@export var first = false

@onready var anim = $"AnimationPlayer"
@onready var area = $"Area3D"
@onready var audio = $"AudioStreamPlayer3D"
@onready var part = $"GPUParticles3D"

func _physics_process(delta):
	if not Lib.paused:
		position.z += (Lib.n_speed + Lib.score / 10) * delta

func _process(_delta):
	if not part.emitting:
		part.visible = false

func _on_area_3d_body_entered(body):
	if body.name == "Player" and not first:
		part.visible = true
		part.emitting = true
		anim.play("bounce")
		audio.pitch_scale = randf_range(1, 2)
		audio.play()
		Lib.score += 1
		area.queue_free()
