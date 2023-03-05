extends "res://scripts/MoveBehavior.gd"

class_name Wave
var move = 1
var direction

func init(_speed):
	speed = _speed
	
func _ready():
#	if I want this to be changeable I need to create another function, likely do this logic on init.
	if(target == Vector2(0,0)):
		direction = Vector2.RIGHT.rotated(get_parent().rotation)
	else:
		direction =	(target - get_parent().position).normalized()
		
func _physics_process(delta):
	get_parent().global_position += (direction.rotated(deg2rad(90)) * speed * int(move) * delta)



func _on_Timer_timeout():
	move *= -1
