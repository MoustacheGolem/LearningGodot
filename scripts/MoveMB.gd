extends "res://scripts/MoveBehavior.gd"

var direction

func init(_speed):
	speed = _speed

func _physics_process(delta):
	var rotation = get_parent().rotation
	var direction = Vector2.RIGHT.rotated(rotation)
	get_parent().global_position += (speed*direction*delta)
	
		
