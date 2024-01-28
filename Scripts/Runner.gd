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

	global_position.y = 1
	$RigidBody3D.global_position.y = 1


func _on_voice_detector_body_entered(body):
	if body.is_in_group("player"):
		var select = randi_range(0,3)
		print(select)
		if select == 0:
			$AudioStreamPlayer3D.play()
		elif select == 1:
			$AudioStreamPlayer3D2.play()
		elif select == 2:
			$AudioStreamPlayer3D3.play()
		elif select == 3:
			$AudioStreamPlayer3D4.play()
		
