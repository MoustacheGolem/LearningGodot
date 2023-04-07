extends Node

# BASE SPELL VALUES
# current level
export(int) var level: int = 1 setget SetLevel
var max_level: int = 7


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

var characterData = load("res://Data/ItemData.tres").spellData.DART

func _ready():
#    print(characterData)
    pass
func _input(event):
    var just_pressed = event.is_pressed() and not event.is_echo()
    if Input.is_key_pressed(KEY_S) and just_pressed:
        LevelDown()
    
    if Input.is_action_just_pressed("key_w"):
        LevelUp()
func _process(delta):
    pass
        



func LevelUp():
    for key in characterData[level]:
        match key:
            "damage_multiplier":
                damage_multiplier += characterData[level].damage_multiplier
            "area_multiplier":
                area_multiplier += characterData[level].area_multiplier
            "projectile_speed_multiplier":
                projectile_speed_multiplier += characterData[level].projectile_speed_multiplier
            "pierce":
                pierce += characterData[level].pierce
            "projectile_count":
                projectile_count += characterData[level].projectile_count
            "duration_multiplier" :
                duration_multiplier += characterData[level].duration_multiplier
            "cooldown_multiplier" :
                cooldown_multiplier -= characterData[level].cooldown_multiplier
    level = clamp(level+1,0,max_level)
    pass

func LevelDown():
    level = clamp(level-1,0,max_level)
    for key in characterData[level]:
        match key:
            "damage_multiplier":
                damage_multiplier -= characterData[level].damage_multiplier
            "area_multiplier":
                area_multiplier -= characterData[level].area_multiplier
            "projectile_speed_multiplier":
                projectile_speed_multiplier -= characterData[level].projectile_speed_multiplier
            "pierce":
                pierce -= characterData[level].pierce
            "projectile_count":
                projectile_count -= characterData[level].projectile_count
            "duration_multiplier" :
                duration_multiplier -= characterData[level].duration_multiplier
            "cooldown_multiplier" :
                cooldown_multiplier += characterData[level].cooldown_multiplier
    pass
    
func SetLevel(new_l):
    while(level != new_l):
        if new_l > level:
            LevelUp()
        elif new_l < level:
            LevelDown()
    pass
    

