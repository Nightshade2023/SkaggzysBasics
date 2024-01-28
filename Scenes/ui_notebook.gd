extends Control


@onready var player = $".."

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
			1: "1",
			2: "5",
			3: "9"
		},
	"correctAnswerID": 1  # Set the correct answer ID here
	},
	3:  {
		"answers": {
			1: "Socko",
			2: "Lefty",
			3: "Muscles"
		},
	"correctAnswerID": 3  # Set the correct answer ID here
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
			1: "(P NAND Q) NAND (Q NAND P)",
			2: "(P NAND Q) NAND Q",
			3: "(P NAND P) NAND (Q NAND P)"
		},
	"correctAnswerID": 3  # Set the correct answer ID here
	}
}

func _on_notebook_option_pressed():
	if questionDictionary[question_ID]["correctAnswerID"] != 1:
		player.aggress += 2
	player.inNotebook = false
	player.isDistracted = false
	player.notebooks_collected += 1
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	print("clicked")
	


func _on_notebook_option_2_pressed():
	if questionDictionary[question_ID]["correctAnswerID"] != 2:
		player.aggress += 2
	player.inNotebook = false
	player.isDistracted = false
	player.notebooks_collected += 1
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _on_notebook_option_3_pressed():
	if questionDictionary[question_ID]["correctAnswerID"] != 3:
		player.aggress += 2
	player.inNotebook = false
	player.isDistracted = false
	player.notebooks_collected += 1
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)


func _on_visibility_changed():
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
