extends "res://scripts/Hitbox.gd"


export(float) var lifetime = 2


func _ready():
	$Sprite/RotateMB.init(10)
	$MoveMB.init(400)
	pass

func _on_DurationTimer_timeout():
	queue_free()


func _on_Axe_area_entered(area):
	queue_free()


func _on_Axe_body_entered(body):
	queue_free()
