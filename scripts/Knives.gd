extends "res://scripts/SpellB.gd"

var KNIFE = preload("res://resources/bases/PlayerProjectileB.tscn")


var remaining_projectiles
var attack_ready = false
var active = false

#
#func Init(_projectile_count, _cooldown): !!FAZER
#	projectile_count += _projectile_count
#	cooldown += _cooldown
		
func _ready():
	if(!KNIFE):
		print("ERRO PROJ KNIFE NOT LOADED")
	SetBaseStats()
	pass
	
func SetBaseStats():
	projectile_count = 1
	cooldown = 1
	pierce = 0
	
	remaining_projectiles = projectile_count
	
func SetLevel(val):
	if val >= 1:
		pass
		

func Activate(val):
	pass
	
func _process(delta):
	if(active):
		if attack_ready and (remaining_projectiles > 0):
			create_knife()
			attack_ready = false
			$Cooldown.wait_time = 0.05
			$Cooldown.start()
			remaining_projectiles -= 1
			
		elif(remaining_projectiles == 0):
			$Cooldown.wait_time = cooldown * (1+cooldown_multiplier)
			$Cooldown.start()
			active = false
			
	else:
		remaining_projectiles = projectile_count
		
func create_knife():
	var knife = KNIFE.instance()
	knife.Init(get_node("."))
	get_tree().current_scene.add_child(knife)
	knife.global_position = get_parent().global_position
	
	knife.rotation = get_parent().aim_direction.normalized().angle()

	
	var placemente_modifier = Vector2(0,rand_range(-20,20)).rotated(knife.rotation)
	knife.global_position += placemente_modifier


func ResetStats():
	pass

func _on_Cooldown_timeout():
	attack_ready = true
	active = true
