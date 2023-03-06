extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var ENEMY = preload("res://resources/bases/EnemyB.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	for i in range(200):
		var enemy = ENEMY.instance()
		enemy.position = Vector2(1000,1000)
		add_child(enemy)
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func GetPlayer():
	return $PlayerB
