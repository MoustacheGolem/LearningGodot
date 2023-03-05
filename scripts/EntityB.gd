extends RigidBody2D

# current maximum health value
export(float) var max_health: float = 100

# current health value
export(float) var health: float = max_health

# how much health is regenerated per second
export(float) var regeneraion: float = 0

# percentage of damage mitigated
export(float) var defence: float = 0

# subtracts damage, aplied before defence
export(float) var block: float = 0

# chance to ignore a attack, only active while moving
export(float) var evasion: float = 0

# base movement speed
export(float) var move_speed = 100

# bonus movement speed
export(float) var move_speed_multiplier: float = 0

# multiplicative modifier to damage
export(float) var damage_multiplier: float = 0

# multiplicative modifier to area
export(float) var area_multiplier: float = 0

# multiplicative modifier to projectile speed
export(float) var projectile_speed_multiplier:  float = 0

# bonus projectile pierce
export(int) var projectile_pierce: int = 0

# multiplicative modifier to duration
export(float) var duration_multiplier: float = 0

# bonus amount
export(float) var amout_bonus: float = 0

# multiplicative modifier to cooldown
export(float) var cooldown_multiplier: float = 0

var velocity


func _ready():
	pass # Replace with function body.

#func move():
#	velocity = move(velocity)


func _integrate_forces(state):
	pass
func _process(delta):
	$HealthBar.value = health
	
	
func _physics_process(delta):
	pass
	
func Die():
	queue_free()
	
func HandleDamage(value):
	health -= (value - block) * (1-defence)
	health = clamp(health,0,max_health)
	$FlashAnimation.play("Flash animation")


