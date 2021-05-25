extends ColorRect



onready var easy_mode = $CenterContainer/VBoxContainer/CenterContainer2/HBoxContainer/Difficulty

onready var selector_one = $CenterContainer/VBoxContainer/CenterContainer2/HBoxContainer/Selector
onready var selector_two = $CenterContainer/VBoxContainer/CenterContainer/HBoxContainer2/Selector2


var current_selection = 2
var currentselection = 0 

func ready():
	set_current_selection(0)
	set_currentselection(0)

func _process(delta):
	if Input.is_action_just_pressed("ui_down") and current_selection < 1:
		current_selection += 1
		set_current_selection(current_selection)
	elif Input.is_action_just_pressed("ui_up") and current_selection > 0:
		currentselection -= 1
		set_current_selection(current_selection)
	elif Input.is_action_just_pressed("ui_accept"):
		set_current_selection(current_selection)


func set_currentselection(_currentselection):
	easy_mode.text = "Easy"
	if currentselection == 1:
		easy_mode.text = "Normal"

func set_current_selection(_current_selection):
	selector_one.text = ""
	selector_two.text = ""
	if current_selection == 1:
		selector_one.text = ">"
	elif current_selection == 2:
		selector_two.text = ">"


