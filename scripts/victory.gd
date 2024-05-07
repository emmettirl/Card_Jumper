extends Control

@onready var ScoreText = $ColorRect/VBoxContainer/MarginContainer3/HBoxContainer/Score

# Called when the node enters the scene tree for the first time.
func _ready():
	print("Victory scene")
	if Globals.level_type == "Random":
		SceneChanger.update_label_text(ScoreText, str(Globals.turns_random))
	else:
		SceneChanger.update_label_text(ScoreText, str(Globals.turns_campaign))
	print("Random Level Score:" + str(Globals.turns_random))
	print("Campaign Score:" + str(Globals.turns_campaign))

func _on_button_pressed():
	print("Switching to title scene.")
	SceneChanger.goto_scene("res://Title.tscn")
