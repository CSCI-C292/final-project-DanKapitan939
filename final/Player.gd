extends KinematicBody2D

export var speed = 200
var target = Vector2()
var velocity = Vector2()

var score = 0

func get_input():
	velocity = Vector2()
	if Input.is_action_pressed("ui_right"):
		velocity.x += 7
		$AnimatedSprite.play("Moving")
		$AnimatedSprite.flip_h = false
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 7
		$AnimatedSprite.play("Moving")
		$AnimatedSprite.flip_h = true
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 7
		$AnimatedSprite.play("Moving")
		$AnimatedSprite.flip_h = false
	if Input.is_action_pressed("ui_down"):
		velocity.y += 7
		$AnimatedSprite.play("Moving")
		$AnimatedSprite.flip_h = false

func _physics_process(delta):
	get_input()
	
	if velocity == Vector2.ZERO:
		$AnimatedSprite.play("Idle")
		
		velocity = Vector2.ZERO
		
	velocity = velocity.normalized() * speed
	
	var collision = move_and_collide(velocity * delta)
	velocity = Vector2.ZERO
	
	if collision:
		var hit = collision.collider.name
		if hit.substr(0,5) == "enemy" || hit.substr(0,9) == "ver_enemy" :
			queue_free()
			GameState.initiate_game_over()

func _on_Coin_0_body_entered(body):
	score += 1
	print(score)



