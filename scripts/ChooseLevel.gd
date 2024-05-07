extends Node


func _on_level_one_button_pressed():
	print("Level 1 Selection")
	SceneChanger.goto_scene("res://scenes/level2.tscn")


func _on_level_two_button_pressed():
	print("Level 2 Selection")
	SceneChanger.goto_scene("res://scenes/level3.tscn")


func _on_level_three_button_pressed():
	print("Level 3 Selection")
	SceneChanger.goto_scene("res://scenes/level4.tscn")


func _on_back_button_pressed():
	print("Back Selected")
	SceneChanger.goto_scene("res://Title.tscn")
