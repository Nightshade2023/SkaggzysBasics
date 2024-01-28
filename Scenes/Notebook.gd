extends Area3D

@onready var player = $"../Player"
@export var QuestionID = 1


func _ready():
	pass 


func _process(delta):
	pass


func _on_body_entered(body):
	if body.is_in_group("player"):
		player.inNotebook = true
		player.QuestionID = QuestionID
		player.isDistracted = true
		queue_free()
