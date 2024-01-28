extends Control

@onready var player = $".."
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	var select = randi_range(1,10)
	if select == 1:
		player.isDistracted = false
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
		player.TMenu = false
		visible = false
	else:
		$Button.set_global_position(Vector2(randi_range(0,1152),randi_range(0,600)))
	
