extends CharacterBody3D

var mouse_sensitivity = Gameinfo.mouseSensativity
var twist_input := 0.0
var SPEED = 5
var stamina = 100
var started := false
var dstarted := false
var sprinting := false
var notebook_collected = 0
@export var isDistracted := false
@export var TMenu = false
@export var notebooks_collected = 0


func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$TravisMenu.visible = TMenu
	mouse_sensitivity = Gameinfo.mouseSensativity
	var input := Vector3.ZERO
	if isDistracted:
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		velocity = Vector3(0,0,0)
		
		
	if not isDistracted:
		input.x = Input.get_axis("A", "D")
		input.z = Input.get_axis("W", "S")
		sprinting = Input.is_action_pressed("SHIFT") && stamina > 0
		velocity = (basis * input * SPEED)
		if sprinting:
			stamina -= .1
		if stamina < 100 && not Input.is_action_pressed("SHIFT"):
			stamina += .3
		
		if sprinting:
			SPEED = 10
		else:
			SPEED = 5
		
		rotate_y(twist_input)
		twist_input = 0.0

	if Input.is_action_just_pressed("ui_cancel"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		$"../Control".visible = true
		get_tree().paused = true
		
	move_and_slide()
	$StaminaBar.value = stamina


func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		if Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
			twist_input = - event.relative.x * mouse_sensitivity


func _on_stamina_recharge_timeout():
	stamina += 10
	started = false


func _on_stamina_discharge_timeout():
	stamina -= 10
	dstarted = false
	
func die():
	get_tree().change_scene_to_file("res://Scenes/Main.tscn")
	
