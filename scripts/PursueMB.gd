extends "res://scripts/MoveBehavior.gd"

var direction

func _ready():
	pass
	
	
func init(_speed, _target = get_tree().current_scene.GetPlayer()):
	speed = 50
	target = get_tree().current_scene.GetPlayer()
	
func _physics_process(delta):
	
	direction = (target.position - get_parent().position).normalized()
	if(get_parent() is Area2D):
		get_parent().global_position += direction * speed * delta
		
	else:
		get_parent().velocity += speed*direction


