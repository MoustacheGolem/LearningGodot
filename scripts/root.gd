extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var ENEMY = preload("res://resources/bases/EnemyB.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
    for i in range(0):
        var enemy = ENEMY.instance()
        enemy.position = Vector2(100,i*10)
        add_child(enemy)
    pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
#	if Input.is_action_just_pressed("key_w"):
#		for i in range(100):
#			var enemy = ENEMY.instance()
#			enemy.position = Vector2(100,i*10)
#			add_child(enemy)
    pass

func GetPlayer():
    return $PlayerB
