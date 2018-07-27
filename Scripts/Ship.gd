extends Node2D

export (int) var max_speed
export (float) var accel
export (int) var radial_max_speed
export (float) var radial_accel

var speed	
var radial_speed

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	speed = 0
	radial_speed = 0 
	
	# Called when the node is added to the scene for the first time.
	# Initialization here
func drag( value , factor ):
	value *= factor
	return value
	
func limit_speed():
	if speed > max_speed:
		speed = max_speed
		
func _process(delta):
	if Input.is_action_pressed("ui_up") and speed <= max_speed:
		speed += accel
	if Input.is_action_pressed("ui_right") and radial_speed <= radial_max_speed:
		radial_speed += radial_accel
	if Input.is_action_pressed("ui_left") and radial_speed <= -radial_max_speed:		
		radial_speed -= radial_accel
	
	speed = drag(speed,.9)
	radial_speed = drag(radial_speed,.9)
	
	print( str(speed) + "," + str(radial_speed) )
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	
