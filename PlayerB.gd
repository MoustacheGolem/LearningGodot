extends "res://scripts/EntityB.gd"


export(float) var experience: float = 0
export var damage = 10.0

export(float) var wisdom: float = 0
export(float) var greed: float = 0
export(float) var luck:float = 0
export(float) var atraction: float = 0

export(float) var provocation: float = 0

export(int) var rerolls: int = 0
export(int) var skips: int = 0
export(int) var purges: int = 0

var spells = []
var aim_direction = Vector2(0,0)
var SPELL = preload("res://Attacks/Knifes.tscn")

func _ready():
	AddSpell()
	pass # Replace with function body.

func AddSpell():
	var spell = SPELL.instance()
	
	add_child(spell)

func get_input_direction():
	return Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")

func _process(delta):
	$HealthBar.value = health
	pass

func move():
	set_linear_velocity(velocity)


func _integrate_forces(state):
	move()
	pass
	
func _physics_process(delta):
	
	
#	if(Input.is_action_pressed("attack_command")):
#		attack()
	
	var input_direction = get_input_direction()
	if(input_direction != Vector2.ZERO):
		aim_direction = input_direction
		$AnimatedSprite.play()
		if(input_direction.x < 0):
			$AnimatedSprite.flip_h = true
		elif(input_direction.x > 0):
			$AnimatedSprite.flip_h = false
		velocity += (input_direction * move_speed * (1+move_speed_multiplier))
	else:
		$AnimatedSprite.stop()
		velocity += Vector2.ZERO
	move()

