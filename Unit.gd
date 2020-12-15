extends KinematicBody

export var team = 0
var team_colors = {
	0: preload("res://TeamOneMat.tres")	
}

var path = []
var path_ind = 0
export var speed = 12
onready var nav = get_parent()

func _ready():
	if team in team_colors:
		$body.material_override = team_colors[team]

func move_to(target_pos):
	path = nav.get_simple_path(global_transform.origin, target_pos)
	path_ind = 0
	
func _physics_process(delta):
	if path_ind < path.size():
		var move_vec = path[path_ind] - global_transform.origin
		# Ignore very small movements
		if move_vec.length() < 0.1:
			path_ind += 1
		else:
			move_vec = move_and_slide(move_vec.normalized() * speed * delta, Vector3(0, 1, 0))
			look_at(path[path_ind] + Vector3(move_vec.x, 0, move_vec.z), Vector3(0, 1, 0))

func select():
	$selection.show()

func deselect():
	$selection.hide()
