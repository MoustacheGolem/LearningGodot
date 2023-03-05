extends "res://scripts/Hitbox.gd"


# base damage of all player projectiles
export var damage = 10.0
# base projectile speed of all projectiles
export var projectile_speed = 200

# Called when the node enters the scene tree for the first time.
func _ready():
	$MoveMB.init(projectile_speed)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
