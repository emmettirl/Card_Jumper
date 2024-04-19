extends Control

@onready var TurnText = $ColorRect/VBoxContainer/HBoxContainer/Score
@onready var TurnText2 = $ColorRect/VBoxContainer/HBoxContainer2/Score
# Called when the node enters the scene tree for the first time.
func _ready():
	SceneChanger.update_label_text(TurnText, str(Globals.turns_campaign))
	SceneChanger.update_label_text(TurnText2, str(Globals.turns_random))
	print("Title Screen Ready")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _on_button_pressed():
	print("Switching to Campaign Menu.")
	SceneChanger.goto_scene("res://ChooseLevel.tscn")


func _on_button_2_pressed():
	print("Switching to Random level.")
	SceneChanger.goto_scene("res://scenes//level.tscn")
