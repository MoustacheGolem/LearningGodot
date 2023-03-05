extends KinematicBody2D


var AXE = preload("res://resources/projectiles/Axe.tscn")

var attack_ready = true

export(int) var speed = 250 setget setSpeed
export(int) var maxspeed = 1000
var velocity = Vector2.ZERO

func _ready():
	pass # Replace with function body.


func _physics_process(delta):
	
	if(Input.is_action_pressed("attack_command")):
		attack()
	
	var input_direction = get_input_direction()
	if(input_direction != Vector2.ZERO):
		velocity = (input_direction * speed)
	else:
		velocity = Vector2.ZERO
	move()
	
#func _process(delta):
#	pass

func attack():
	if AXE and attack_ready:
		var axe = AXE.instance()
		get_tree().current_scene.add_child(axe)
		axe.global_position = self.global_position
		
		axe.rotation = get_input_direction().normalized().angle()
		attack_ready = false
		$AttackCooldown.start()
	
func get_input_direction():
	var direction = Vector2.ZERO
	if Input.is_action_pressed("ui_left"):
		direction.x = -1
	if Input.is_action_pressed("ui_right"):
		direction.x = 1
	if Input.is_action_pressed("ui_down"):
		direction.y = 1
	if Input.is_action_pressed("ui_up"):
		direction.y = -1
	
	return direction

func move():
	velocity = move_and_slide(velocity)

func setSpeed(_speed):
	speed = _speed


func _on_AttackCooldown_timeout():
	attack_ready = true
	

