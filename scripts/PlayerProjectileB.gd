extends "res://scripts/Hitbox.gd"



# base damage of all player projectiles
export var damage = 25.0

# base duration of all player projectiles
export(float) var duration: float = 6

# base projectile speed of all projectiles
export var projectile_speed = 200

# multiplicative modifier to damage
export(float) var damage_multiplier: float = 0

# multiplicative modifier to area
export(float) var area_multiplier: float = 0

# multiplicative modifier to projectile speed
export(float) var projectile_speed_multiplier:  float = 0

# projectile pierce
export(int) var projectile_pierce: int = 10

# multiplicative modifier to duration
export(float) var duration_multiplier: float = 0


func Init(_damage_multiplier, _area_multiplier, _projectile_speed_multiplier, _projectile_pierce, _duration_multiplier):
	damage *=  (1+_damage_multiplier)
	scale *= _area_multiplier
	projectile_speed *=  _projectile_speed_multiplier
	projectile_pierce += _projectile_pierce

func _ready():
	$MoveMB.init(projectile_speed)
	$DurationTimer.start(duration * (1+duration_multiplier))
	
func Die():
	queue_free()

func HanldeHit():
	if(projectile_pierce > 0):
		projectile_pierce -= 1
	else:
		Die()
	
func _on_PlayerProjectileBase_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	HanldeHit()
	area.get_parent().HandleDamage(damage * (1+damage_multiplier))

func _on_DurationTimer_timeout():
	Die()

func _on_Notifier_screen_exited():
	queue_free()
