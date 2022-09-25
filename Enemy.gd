extends KinematicBody2D


export var health = 100
const MAXFALLSPEED = 200
const GRAVITY = 20
var motion=Vector2()

func _physics_process(delta):
	motion.y += GRAVITY
	
	if motion.y > MAXFALLSPEED:
		motion.y = MAXFALLSPEED
		
	if health <= 0:
		queue_free()
		
	motion=move_and_slide(motion, Vector2.UP)

func _on_Area2D_area_entered(body):
	if body.is_in_group("damage"):
		health -= 50
