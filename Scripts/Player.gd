extends CharacterBody3D

var mouse_sensitivity := 0.001
var twist_input := 0.0
var SPEED = 5
var stamina = 100
var started := false
func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var input := Vector3.ZERO
	input.x = Input.get_axis("A", "D")
	input.z = Input.get_axis("W", "S")
	
	velocity = (basis * input * SPEED)
	
	if Input.is_action_just_pressed("ui_cancel"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		
	if Input.is_action_pressed("SHIFT") && stamina > 0:
		SPEED = 10
		stamina -= 1
	else:
		SPEED = 5
		if not started && stamina < 100:
			$"Stamina Recharge".start(0.1)
			started = true
	rotate_y(twist_input)
	twist_input = 0.0
	
	move_and_slide()


func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		if Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
			twist_input = - event.relative.x * mouse_sensitivity


func _on_stamina_recharge_timeout():
	stamina += 10
	started = false
