extends CharacterBody3D

var speed = 4
var accel = 20
var whichTarget := false
var Chasing = false
var mathCenter := Vector3(38,.5,2)

@onready var nav: NavigationAgent3D = $NavigationAgent3D

# Called when the node enters the scene tree for the first time.
func _ready():
	nav.target_position = Vector3(randi_range(-3, 76), 0 ,randi_range(28, -52))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var direction = Vector3()
	
	if global_position.distance_to(nav.target_position) <= 20 && not Chasing:
		nav.target_position = Vector3(randi_range(-3, 76), 0 ,randi_range(28, 52))
	
	if Chasing:
		nav.target_position = $"../Player".global_position
		speed = 8
		accel = 40
		
	direction = (nav.get_next_path_position() - global_position + Vector3(randf_range(-1,1),0,randf_range(-1,1))).normalized()

	velocity = velocity.lerp(direction * speed, accel * delta)
	
	move_and_slide()


func _on_plr_detector_body_entered(body):
	if body.is_in_group("player"):
		Chasing = true
		$AudioStreamPlayer3D.play()
	

func _on_plr_detector_body_exited(body):
	if body.is_in_group("player"):
		Chasing = false


func _on_grab_detector_body_entered(body):
	if body.is_in_group("player"):
		global_position = mathCenter
		body.global_position = mathCenter
		$AudioStreamPlayer3D2.play()
		$AudioStreamPlayer3D.stop()
		Chasing = false
	
