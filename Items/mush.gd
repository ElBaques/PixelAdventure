extends KinematicBody2D

export var speed = 64
export var health = 1
var vel = Vector2.ZERO
var move_direction = -1

func _physics_process(delta: float)-> void:
	vel.x = speed * move_direction
	
	vel = move_and_slide(vel)
	
	if move_direction == 1:
		$texture.flip_h = true
	else:
		$texture.flip_h = false
	if $ray_wall.is_colliding:
		$anim.play("idle")	



func _on_anim_animation_finished(anim_name: String)-> void:
	if anim_name == "idle":
		$texture.flip_h != $texture.flip_h
		$ray_wall.scale.x *= -1
		move_direction *-1
		$anim.play("run")

