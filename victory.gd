extends Control

@onready var ScoreText = $ColorRect/VBoxContainer/MarginContainer3/HBoxContainer/Score

# Called when the node enters the scene tree for the first time.
func _ready():
	print("Victory scene")
	print(Globals.turns)
	SceneChanger.update_label_text(ScoreText, str(Globals.turns))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	print("Switching to title scene.")
	SceneChanger.goto_scene("res://Title.tscn")
