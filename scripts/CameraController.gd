extends Node


onready var camera = get_node("Camera2D")
var speed = 300

func _ready():
	set_process(true)


func _process(delta):
	var left = Input.get_action_strength("camera_left")
	var right = Input.get_action_strength("camera_right")
	var up = Input.get_action_strength("camera_up")
	var down = Input.get_action_strength("camera_down")
	
	camera.position.x += speed * delta * (right-left)
	camera.position.y += speed * delta * (down - up)
