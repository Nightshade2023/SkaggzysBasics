extends Control

@onready var skaggs = $"../Follower"
@onready var player = $"../Player"

@export var question_ID = 1


# Add questions
var questionDictionary = {
	1: {
		"answers": {
			1: "TRUE",
			2: "FALSE",
			3: "NOT ENOUGH INFO"
		},
	"correctAnswerID": 2  # Set the correct answer ID here
	},
	2:  {
		"answers": {
			1: "Answer 1 text here.",
			2: "Answer 2 text here.",
			3: "Answer 3 text here."
		},
	"correctAnswerID": 2  # Set the correct answer ID here
	},
	3:  {
		"answers": {
			1: "A",
			2: "A",
			3: "A"
		},
	"correctAnswerID": 2  # Set the correct answer ID here
	},
	4:  {
		"answers": {
			1: "VALID",
			2: "NON-VALID",
			3: "NOT ENOUGH INFO"
		},
	"correctAnswerID": 2  # Set the correct answer ID here
	},
	5:  {
		"answers": {
			1: "Answer 1 text here.",
			2: "Answer 2 text here.",
			3: "Answer 3 text here."
		},
	"correctAnswerID": 2  # Set the correct answer ID here
	}
}

func _ready():

	if question_ID == 1:
		$question_texture.visible = true 
	elif question_ID == 2:
		$question_texture2.visible = true 
	elif question_ID == 3:
		$question_texture3.visible = true 
	elif question_ID == 4:
		$question_texture4.visible = true 
	elif question_ID == 5:
		$question_texture5.visible = true 
		
	$notebook_option.text = questionDictionary[question_ID]["answers"][1]
	$notebook_option2.text = questionDictionary[question_ID]["answers"][2]
	$notebook_option3.text = questionDictionary[question_ID]["answers"][3]

func _on_notebook_option_pressed():
	if questionDictionary[question_ID]["correctAnswerID"] != 1:
		skaggs.speed += 2
	visible = false
	player.isDistracted = false
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)


func _on_notebook_option_2_pressed():
	if questionDictionary[question_ID]["correctAnswerID"] != 2:
		skaggs.speed += 2
	visible = false
	player.isDistracted = false
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _on_notebook_option_3_pressed():
	if questionDictionary[question_ID]["correctAnswerID"] != 3:
		skaggs.speed += 2
	visible = false
	player.isDistracted = false
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
