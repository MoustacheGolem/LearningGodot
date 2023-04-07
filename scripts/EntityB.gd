extends RigidBody2D

export(int) var level: float = 1
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

# base movement speed
export(float) var move_speed = 100

# bonus movement speed
export(float) var move_speed_multiplier: float = 0

# base shield speed
export(int) var shield = 0

# multiplicative modifier to damage
export(float) var damage_multiplier: float = 0

# multiplicative modifier to area
export(float) var area_multiplier: float = 0

# multiplicative modifier to projectile speed
export(float) var projectile_speed_multiplier:  float = 0

# bonus projectile pierce
export(int) var pierce: int = 0

# bonus amount
export(float) var projectile_count_bonus: float = 0

# multiplicative modifier to duration
export(float) var duration_multiplier: float = 0

# multiplicative modifier to cooldown
export(float) var cooldown_multiplier: float = 0

var velocity = Vector2.ZERO


func _ready():
    pass # Replace with function body.

#func move():
#	velocity = move(velocity)

func move():
    set_linear_velocity(velocity)
#	move_and_slide(velocity)

func _integrate_forces(state):
    move()
    
func _process(delta):
    $HealthBar.value = health
    
    
func _physics_process(delta):
#	if Performance.get_monitor(Performance.TIME_FPS) < 30:
#		if randi() % 2 == 0:
#			return
    
    velocity = Vector2.ZERO
    
    
func Die():
    queue_free()
    
func HandleDamage(value):
    health -= (value - block) * (1-defence)
    health = clamp(health,0,max_health)
    if(health == 0):
        Die()
    $FlashAnimation.play("Flash animation")


