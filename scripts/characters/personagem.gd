extends CharacterBody2D

@export var speed := 300.0
var direction := Vector2.ZERO

func _physics_process(delta):
	direction.x = 0

	if Input.is_action_pressed("move_left"):
		direction.x = -1
	elif Input.is_action_pressed("move_right"):
		direction.x = 1

	velocity.x = direction.x * speed
	move_and_slide()

	update_animation()


func update_animation():
	var sprite = $AnimatedSprite2D

	if direction.x != 0:
		sprite.play("walk")
		sprite.flip_h = direction.x < 0
	else:
		sprite.stop()
		
