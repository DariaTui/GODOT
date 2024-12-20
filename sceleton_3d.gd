extends CharacterBody3D

var SPEED = 3.0 

var states = []
@onready var anim_tree = $AnimationTree
@onready var nav_agent = $NavigationAgent3D

func _physics_process(delta: float) -> void:
	var current_location = global_transform.origin
	var next_location = nav_agent.get_next_path_position()
	var new_velocity = (next_location - current_location).normalized() * SPEED
	
	velocity = new_velocity
	move_and_slide()

func update_target_location(target_location):
	nav_agent.set_target_position(target_location)
