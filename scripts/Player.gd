extends KinematicBody2D

var vel = Vector2.ZERO
var move_speed = 480
var gravity = 1200
var jump_force = -720
var is_grounded
onready var raycasts = $raycasts

func _physics_process(delta: float) -> void:
	vel.y += gravity * delta 
	
	_get_input()

	vel = move_and_slide(vel)
	
	is_grounded = _check_is_ground()

func _get_input():
	var move_direction = int(Input.is_action_pressed("move_right")) - int(Input.is_action_pressed("move_left"))
	vel.x = move_speed * move_direction
	
	if move_direction !=0:
		$texture.scale.x = move_direction

func _input(event: InputEvent) -> void:
	print(is_grounded)
	if event.is_action_pressed("jump") and is_grounded:
		vel.y = jump_force /2

func _check_is_ground():
	for raycast in raycasts.get_children():
		if raycast.is_colliding():
			return true
	return false		

func _set_animation():
	var anim = "idle"
	
	if !is_grounded:
		anim = "jump"
	
