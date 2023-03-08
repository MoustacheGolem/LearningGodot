extends "res://scripts/EntityB.gd"


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$PursueMB.init(15,Vector2(100,100))
	pass # Replace with function body.
	

	
func _physics_process(delta):
	velocity = Vector2.ZERO

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


