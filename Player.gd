extends KinematicBody
signal hit

# Export allows us to edit this in the Inspector.
export var speed = 4

var screen_size
var vel = Vector3()
var dir = Vector3()

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport().size # If we need to know the screen size

func _physics_process(delta):
	process_input(delta)
	process_movement(delta)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func process_input(delta):
	#1 Check for input
	dir = Vector3()
	if Input.is_action_pressed("ui_left"):
		dir.x -= 1
	if Input.is_action_pressed("ui_right"):
		dir.x += 1
	if Input.is_action_pressed("ui_up"):
		dir.z -= 1
	if Input.is_action_pressed("ui_down"):
		dir.z += 1
	
func process_movement(delta):
	dir = dir.normalized()
	vel = move_and_slide(dir * speed * delta, Vector3.UP)
	print(vel)
	
