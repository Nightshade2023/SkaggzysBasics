extends CharacterBody3D

var speed = 30
var accel = 25
var whichTarget := false

@onready var nav: NavigationAgent3D = $NavigationAgent3D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var direction = Vector3()
	
	if global_position.distance_to(nav.target_position) <= 3:
		whichTarget = !whichTarget
	
	if whichTarget:
		nav.target_position = Vector3(76, 0, 30)
	else:
		nav.target_position = Vector3(0, 0, -45)
		
	direction = (nav.get_next_path_position() - global_position + Vector3(randf_range(-1,1),0,randf_range(-1,1))).normalized()

	velocity = velocity.lerp(direction * speed, accel * delta)
	
	move_and_slide()


