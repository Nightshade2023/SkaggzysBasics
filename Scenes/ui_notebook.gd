extends Control

@onready var skaggs = $"../Follower"
@onready var player = $"../Player"

@export var question_ID = 1


# Add questions
var questionDictionary = {
	1: {
		"question": "Determine whether the following statement is TRUE or FALSE.

Let P represent the set of prime numbers.

4 element of left curly bracket x element of real numbers invisible times vertical line text   end text 13 invisible times minus text   end text 2 x element of left curly bracket y invisible times vertical line y invisible times element of P right curly bracket right curly bracket blank",
		"answers": {
			1: "Answer 1 text here.",
			2: "Answer 2 text here.",
			3: "Answer 3 text here."
		},
	"correctAnswerID": 2  # Set the correct answer ID here
	},
	2:  {
		"question": "Your question text here.",
		"answers": {
			1: "Answer 1 text here.",
			2: "Answer 2 text here.",
			3: "Answer 3 text here."
		},
	"correctAnswerID": 2  # Set the correct answer ID here
	},
	3:  {
		"question": "Your question text here.",
		"answers": {
			1: "Answer 1 text here.",
			2: "Answer 2 text here.",
			3: "Answer 3 text here."
		},
	"correctAnswerID": 2  # Set the correct answer ID here
	},
	4:  {
		"question": "Your question text here.",
		"answers": {
			1: "Answer 1 text here.",
			2: "Answer 2 text here.",
			3: "Answer 3 text here."
		},
	"correctAnswerID": 2  # Set the correct answer ID here
	},
	5:  {
		"question": "Your question text here.",
		"answers": {
			1: "Answer 1 text here.",
			2: "Answer 2 text here.",
			3: "Answer 3 text here."
		},
	"correctAnswerID": 2  # Set the correct answer ID here
	}
}

func _ready():
	$notebook_question.text = questionDictionary[question_ID]["question"]
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
