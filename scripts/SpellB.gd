extends Node

# current level
export(int) var level: int = 0 setget SetLevel
# how many projectiles are fired per cast
export(int) var projectile_count: int = 1
# base cooldown
export(float) var cooldown: float = 2.0
# how many enemies are pierced
export(int) var pierce: int = 0
# multiplicative modifier to projectile speed
export(float) var projectile_speed_multiplier:  float = 0
# multiplicative damage modifier
export(float) var damage_multiplier: float = 0
# multiplicative area modifier
export(float) var area_multiplier: float = 0
# multiplicative duration modifier
export(float) var duration_multiplier: float = 0


	
	
func _ready():
	ResetStats()
	pass 

func LevelUp():
	SetLevel(level+1)

func SetLevel(val):
	assert(false)
	
func ResetStats():
	damage_multiplier = 0
	projectile_speed_multiplier = 0
	area_multiplier = 0
	duration_multiplier = 0
