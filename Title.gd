extends Control

@onready var TurnText = $ColorRect/VBoxContainer/HBoxContainer/Score
# Called when the node enters the scene tree for the first time.
func _ready():
	print("Title Screen Ready")
	SceneChanger.update_label_text(TurnText, str(Globals.turns))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _on_button_pressed():
	print("Switching to main level.")
	SceneChanger.goto_scene("res://scenes//level.tscn")
