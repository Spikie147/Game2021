extends KinematicBody2D

export(int) var speed = 80.0
export (int) var jump_speed = -200
export (int) var gravity = 900
export (float, 0, 1.0) var friction = 0.2
export (float, 0, 1.0) var acceleration = 0.25

var velocity = Vector2.ZERO

func _physics_process(delta):
	get_input()
	velocity.y += gravity * delta
	velocity = move_and_slide(velocity, Vector2.UP)
	if Input.is_action_just_pressed("ui_up"):
		if is_on_floor():
			velocity.y = jump_speed



func get_input():
	var dir = 0
	if Input.is_action_pressed("ui_right"):
		dir += 1
		$AnimationPlayer.play("Running")
		~$AnimationPlayer.flip_h = true
	if Input.is_action_pressed("ui_left"):
		dir -= 1
		$AnimationPlayer.play("Running")
		$AnimationPlayer.flip_h = false
	if dir != 0:
		velocity.x = lerp(velocity.x, 0, friction)
	else:
		velocity.x = lerp(velocity.x, 0, friction)
		$AnimationPlayer.play("Idle")


