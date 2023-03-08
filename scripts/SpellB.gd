extends Node

# BASE SPELL VALUES
# current level
export(int) var level: int = 1 setget SetLevel
var max_level: int = 8


# multiplicative modifier to projectile speed
export(float) var damage_multiplier: float = 0
# multiplicative area modifier
export(float) var area_multiplier: float = 0
# how many enemies are pierced
export(float) var projectile_speed_multiplier:  float = 0
# multiplicative damage modifier
export(int) var pierce: int = 0
# how many projectiles are fired per cast
export(int) var projectile_count: int = 1
# multiplicative duration modifier
export(float) var duration_multiplier: float = 0
# base cooldown
export(float) var cooldown: float = 2.0
var cooldown_multiplier: float = 0



func _ready():
	pass
func _input(event):
	var just_pressed = event.is_pressed() and not event.is_echo()
	if Input.is_key_pressed(KEY_S) and just_pressed:
		LevelDown()
	
	if Input.is_action_just_pressed("key_w"):
		LevelUp()
func _process(delta):
	pass
		
var weaponData = [{},{"cooldown_multiplier":1, "area_multiplier":1},{"cooldown_multiplier":1,"area_multiplier":0.1},{"damage_multiplier":0.5, "area_multiplier":0.1}]

func LevelUp():
	for key in weaponData[level]:
		match key:
			"damage_multiplier":
				damage_multiplier += weaponData[level].damage_multiplier
			"area_multiplier":
				area_multiplier += weaponData[level].area_multiplier
			"projectile_speed_multiplier":
				projectile_speed_multiplier += weaponData[level].projectile_speed_multiplier
			"pierce":
				pierce += weaponData[level].pierce
			"projectile_count":
				projectile_count += weaponData[level].projectile_count
			"duration_multiplier" :
				duration_multiplier += weaponData[level].duration_multiplier
			"cooldown_multiplier" :
				cooldown_multiplier -= weaponData[level].cooldown_multiplier
	level = clamp(level+1,0,max_level)
	pass

func LevelDown():
	level = clamp(level-1,0,max_level)
	for key in weaponData[level]:
		match key:
			"damage_multiplier":
				damage_multiplier -= weaponData[level].damage_multiplier
			"area_multiplier":
				area_multiplier -= weaponData[level].area_multiplier
			"projectile_speed_multiplier":
				projectile_speed_multiplier -= weaponData[level].projectile_speed_multiplier
			"pierce":
				pierce -= weaponData[level].pierce
			"projectile_count":
				projectile_count -= weaponData[level].projectile_count
			"duration_multiplier" :
				duration_multiplier -= weaponData[level].duration_multiplier
			"cooldown_multiplier" :
				cooldown_multiplier += weaponData[level].cooldown_multiplier
	pass
	
func SetLevel(new_l):
	while(level != new_l):
		if new_l > level:
			LevelUp()
		elif new_l < level:
			LevelDown()
	pass
	

