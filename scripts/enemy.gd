extends KinematicBody2D

export var FM = 1.0
var speed = 100

var target 

func _ready():
	pass
	
#	$AnimatedSprite.material.set_shader_param("flash_modifier",0)
#	tween.tween_property($AnimatedSprite.material,"shader_param/flash_modifier", 1,1)
	

func _process(delta):
	
	$AnimatedSprite.material.set_shader_param("flash_modifier",FM)
	if Input.is_action_pressed("key_w"):
		var tween := create_tween().set_trans(Tween.TRANS_LINEAR).set_ease(Tween.EASE_IN_OUT)
		tween.tween_property(self,"FM", 0.0,1)
		

func SetTarget(_target):
	self.target = _target
	
func SetSpeed(_speed):
	speed = _speed

func Die():
	queue_free()

func _on_Hurtbox_area_entered(area):
	pass
	


func _on_Hurtbox_body_entered(body):
	Die()
