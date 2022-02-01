extends KinematicBody2D


var normal = Vector2.UP

export var speed = 100

var up=0
var left=0
var right=0

export var gravity = 20
var wall_sliding = int(gravity/2)
var wall_climbing = -250


var jump_ctr = 2

export var jump_strength = 450
var jump_up = false

var movement_mode = 0  # 0 - Land, 1 - Wall, 2 - Water

var velocity = Vector2.ZERO


func _ready():
	Engine.set_target_fps(60)
	set_physics_process(true)
	set_process(true)


func _process(delta):
	up = Input.get_action_strength("camera_up")
	jump_up = Input.is_action_just_pressed("camera_up")
	left = Input.get_action_strength("camera_left")
	right = Input.get_action_strength("camera_right")


func _physics_process(delta):
	if not movement_mode:
		if is_on_wall():
			movement_mode = 1
			velocity = Vector2.ZERO
		
		if is_on_floor()	:
			jump_ctr = 2
		
		velocity.y += gravity
		velocity.x = (right-left)*speed
		if jump_up and jump_ctr:
			velocity.y = 0
			jump_ctr -= 1
			velocity.y = -jump_strength
		
			
	elif movement_mode == 1:
		if  not is_on_wall():
			movement_mode = 0
		velocity.y += wall_sliding
		if up:
			velocity.y = wall_climbing
	
	velocity = move_and_slide(velocity, normal)
		

