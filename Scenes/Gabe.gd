extends StaticBody3D

@export var ID = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	var select = randi_range(0,2)
	if select == 0:
		$Sprite3D.visible = true
	elif select == 1:
		$Sprite3D2.visible = true
	elif select == 2:
		$Sprite3D3.visible = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_3d_body_entered(body):
	if body.is_in_group("player"):
		$AudioStreamPlayer3D.play()
