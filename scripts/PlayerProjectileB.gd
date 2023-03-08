extends "res://scripts/Hitbox.gd"


# base damage of all player projectiles
export var base_damage = 25.0
var damage = base_damage
# base projectile speed of all projectiles
export var base_projectile_speed = 200
var projectile_speed = base_projectile_speed
# base duration of all player projectiles
export(float) var duration: float = 1


# multiplicative modifier to damage
export(float) var damage_multiplier: float = 0

# multiplicative modifier to area
export(float) var area_multiplier: float = 0

# multiplicative modifier to projectile speed
export(float) var projectile_speed_multiplier:  float = 0

# projectile pierce
export(int) var pierce: int = 0

# multiplicative modifier to duration
export(float) var duration_multiplier: float = 0

var parent_spell 
var player

func Init(parent):
	parent_spell = parent

func _ready():
	player = get_tree().current_scene.get_child(0)
	$MoveMB.Init(projectile_speed)
	pierce += parent_spell.pierce + player.pierce
	$DurationTimer.start(duration * (1+parent_spell.duration_multiplier+player.duration_multiplier))
	
	UpdateStats()

func _process(delta):
	UpdateStats()
	
func Die():
	queue_free()

func UpdateStats():
	damage = base_damage * (1 + parent_spell.damage_multiplier + player.damage_multiplier)
	
	var l_scale = (1+parent_spell.area_multiplier + player.area_multiplier)
	
	$CollisionShape2D.scale = Vector2(l_scale,l_scale)
	$AnimatedSprite.scale = Vector2(l_scale,l_scale)
	
	$MoveMB.speed = (base_projectile_speed *(1 + parent_spell.projectile_speed_multiplier + player.projectile_speed_multiplier))
	
	
	
func HanldeHit():
	if(pierce > 0):
		pierce -= 1
	else:
		Die()
	
func _on_PlayerProjectileBase_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	HanldeHit()
	area.get_parent().HandleDamage(damage)

func _on_DurationTimer_timeout():
	Die()

func _on_Notifier_screen_exited():
	queue_free()
