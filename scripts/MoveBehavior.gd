extends Node

export(Vector2) var target = Vector2(0,0) setget setTarget
export(int) var speed = 100 setget setSpeed
export(int) var maxspeed = 1000


func setSpeed(val):
	if val != speed:
		speed = clamp(val,0,1000)
		
func setTarget(val):
	target = val



