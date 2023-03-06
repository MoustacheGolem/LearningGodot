extends "res://scripts/SpellB.gd"

var KNIFE = preload("res://resources/bases/PlayerProjectileB.tscn")
const  default_projectiles = 10
const  default_cooldown = 1
const  default_pierce = 5

var remaining_projectiles = default_projectiles
var attack_ready = false
var active = false

#
#func Init(_projectile_count, _cooldown): !!FAZER
#	projectile_count += _projectile_count
#	cooldown += _cooldown
		
func _ready():
	ResetStats()
	pass
	

func SetLevel(val):
	if val >= 1:
		pass
		

func Activate(val):
	pass
	
func _process(delta):
	if(active):
		if KNIFE and attack_ready and (remaining_projectiles > 0):
			create_knife()
			attack_ready = false
			$Cooldown.wait_time = 0.05
			$Cooldown.start()
			remaining_projectiles -= 1
			
		elif(remaining_projectiles == 0):
			$Cooldown.wait_time = cooldown
			$Cooldown.start()
			active = false
			remaining_projectiles = projectile_count
	
		
		
func create_knife():
	var knife = KNIFE.instance()
	
	get_tree().current_scene.get_parent().add_child(knife)
	knife.global_position = get_parent().global_position
#	knife.global_position = Vector2(100,100)
	
	knife.rotation = get_parent().aim_direction.normalized().angle()
#	knife.rotation = Vector2(1,1).angle()
	
	var placemente_modifier = Vector2(0,rand_range(-20,20)).rotated(knife.rotation)
	knife.global_position += placemente_modifier


func ResetStats():
	projectile_count = default_projectiles
	cooldown = default_cooldown
	pierce = default_pierce

func _on_Cooldown_timeout():
	attack_ready = true
	active = true
