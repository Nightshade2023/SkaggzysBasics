extends CharacterBody3D

var speed = 2
var accel = 10
var whichTarget := false
var Chasing = false

@onready var nav: NavigationAgent3D = $NavigationAgent3D

# Called when the node enters the scene tree for the first time.
func _ready():
	nav.target_position = Vector3(randi_range(-3, 76), 0 ,randi_range(28, -52))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var direction = Vector3()
	
	if global_position.distance_to(nav.target_position) <= 20 && not Chasing:
		nav.target_position = Vector3(randi_range(-3, 76), 0 ,randi_range(28, 52))
	
		
	direction = (nav.get_next_path_position() - global_position + Vector3(randf_range(-1,1),0,randf_range(-1,1))).normalized()

	velocity = velocity.lerp(direction * speed, accel * delta)
	
	move_and_slide()


func _on_area_3d_body_entered(body):
	if body.is_in_group("player"):
		body.isDistracted = true
		body.TMenu = true
