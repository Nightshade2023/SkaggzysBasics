extends Area3D

@onready var player = $"../Player"


func _ready():
	pass 


func _process(delta):
	pass


func _on_body_entered(body):
	if body.is_in_group("player"):
		
		player.notebooks_collected += 1
		queue_free()
		
		
		
