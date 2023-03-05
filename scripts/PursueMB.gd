extends "res://scripts/MoveBehavior.gd"

var direction

func _ready():
	direction = (target - get_parent().position).normalized()
	
func init(_speed,_target):
	speed = _speed
	target = _target
	
func _physics_process(delta):
	get_parent().global_position += direction * speed * delta


