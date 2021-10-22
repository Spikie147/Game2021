extends KinematicBody2D

export (int) var speed = 160.0
export (int) var jump_speed = -225
export (int) var gravity = 900
export (float, 0, 1.0) var friction = 0.2
export (float, 0, 1.0) var acceleration = 0.25

# these are the variables that are used thru

var velocity = Vector2.ZERO

func _physics_process(delta):
	get_input()
	velocity.y += gravity * delta
	velocity = move_and_slide(velocity, Vector2.UP)
	if Input.is_action_just_pressed("ui_up"):
		if is_on_floor():
			velocity.y = jump_speed
# this code here gives the gravity so when I press the spacebar I dont continuously rise, this will make me fall at an accelerated speed


func get_input():
	var dir = 0
	if Input.is_action_pressed("ui_right"):
		dir = 1
		$AnimationPlayer.play("Running")
		$Sprite.flip_h= true
	if Input.is_action_pressed("ui_left"):
		dir = -1
		$AnimationPlayer.play("Running")
		$Sprite.flip_h= false
	if dir != 0:
		velocity.x = lerp(velocity.x, speed*dir, acceleration)
		$AnimationPlayer.play("Running")
	else:
		velocity.x = lerp(velocity.x, 0, friction)
		$AnimationPlayer.play("Idle")
# Written the code myself, does not work as intended and have been trying to fix without help. This did not work very well. I based my code off of 
# previous attemps and some videos on youtube. 
# this code is the animation of the player when he moves/does not move.


