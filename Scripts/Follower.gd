extends CharacterBody3D

@export var speed = 4
var accel = 20

@onready var nav: NavigationAgent3D = $NavigationAgent3D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var direction = Vector3()
	nav.target_position = $"../Player".global_position
	direction = (nav.get_next_path_position() - global_position).normalized()

	velocity = velocity.lerp(direction * speed, accel * delta)
	
	move_and_slide()


func _on_area_3d_body_entered(body):
	if body.is_in_group("player"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		body.die()
