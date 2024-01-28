extends Node3D

var running := false

# Called when the node enters the scene tree for the first time.
func _ready():
	$StaticBody3D2.global_position.y = 10
	$StaticBody3D3.global_position.y = 10
	$StaticBody3D4.global_position.y = 10
	$StaticBody3D.global_position.y = 10


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if not running:
		$GabeTimer.start(15)
		running = true


func _on_gabe_timer_timeout():
	running = false
	var select = randi_range(0,3)
	if select == 0:
		$StaticBody3D.global_position.y = 0
		$StaticBody3D2.global_position.y = 10
		$StaticBody3D3.global_position.y = 10
		$StaticBody3D4.global_position.y = 10
	elif select == 1:
		$StaticBody3D2.global_position.y = 0
		$StaticBody3D.global_position.y = 10
		$StaticBody3D3.global_position.y = 10
		$StaticBody3D4.global_position.y = 10
	elif select == 2:
		$StaticBody3D3.global_position.y = 0
		$StaticBody3D2.global_position.y = 10
		$StaticBody3D.global_position.y = 10
		$StaticBody3D4.global_position.y = 10
	elif select == 3:
		$StaticBody3D4.global_position.y = 0
		$StaticBody3D2.global_position.y = 10
		$StaticBody3D3.global_position.y = 10
		$StaticBody3D.global_position.y = 10
