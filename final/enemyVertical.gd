extends KinematicBody2D

var velocity = Vector2()
export var direction = -1
func _ready():
	pass
func _physics_process(delta):
	if is_on_wall():
		direction = direction * -1
	velocity.y = 75 * direction
	
	move_and_slide(velocity, Vector2.RIGHT)
