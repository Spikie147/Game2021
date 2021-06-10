extends ColorRect


onready var mode_select = $CenterContainer/VBoxContainer/CenterContainer/HBoxContainer/Difficulty

onready var selector_one = $CenterContainer/VBoxContainer/CenterContainer/HBoxContainer/Selector
onready var selector_two = $CenterContainer/VBoxContainer/CenterContainer2/HBoxContainer2/SelectorTwo

var current_selection = 0
var difficulty = 0


func _ready():
	set_current_selection(0)


func _process(_delta):
	if Input.is_action_just_pressed("ui_down") and current_selection < 1:
		current_selection += 1
		set_current_selection(current_selection)
	elif Input.is_action_just_pressed("ui_up") and current_selection > 0:
		current_selection -= 1
		set_current_selection(current_selection)
	elif Input.is_action_just_pressed("ui_accept") and current_selection >=1:
		OS.window_fullscreen = !OS.window_fullscreen


func _on_Window_Size_pressed():
	if Input.is_action_just_pressed("ui_accept") and current_selection >=1:
		OS.window_fullscreen = !OS.window_fullscreen


func set_current_selection(_current_selection):
	selector_one.text = ""
	selector_two.text = ""
	if current_selection == 0:
		selector_one.text = ">"
	elif current_selection == 1:
		selector_two.text = ">"
