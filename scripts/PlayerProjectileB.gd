extends "res://scripts/Hitbox.gd"



# base damage of all player projectiles
export var damage = 10.0

# base duration of all player projectiles
export(float) var duration: float = 2

# base projectile speed of all projectiles
export var projectile_speed = 200

# multiplicative modifier to damage
export(float) var damage_multiplier: float = 0

# multiplicative modifier to area
export(float) var area_multiplier: float = 0

# multiplicative modifier to projectile speed
export(float) var projectile_speed_multiplier:  float = 0

# projectile pierce
export(int) var projectile_pierce: int = 0

# multiplicative modifier to duration
export(float) var duration_multiplier: float = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	$MoveMB.init(projectile_speed)
	pass # Replace with function body.

func Init(_damage_multiplier,_area_multiplier,_projectile_speed_multiplier,_projectile_pierce):
	pass


func Die():
	queue_free()

func HanldeHit():
	if(projectile_pierce > 0):
		projectile_pierce -= 1
	else:
		Die()
	
func _on_PlayerProjectileBase_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	HanldeHit()


func _on_PlayerProjectileBase_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	pass # Replace with function body.
