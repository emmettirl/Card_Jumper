extends Control

@onready var NameLabel = $Panel/MarginContainer/VBoxContainer/MarginContainer/NameLabel
@onready var ImageBG = $Panel/MarginContainer/VBoxContainer/MarginContainer2/ImageBG
@onready var Direction = $Panel/MarginContainer/VBoxContainer/MarginContainer3/HBoxContainer/Direction
@onready var Magnitude = $Panel/MarginContainer/VBoxContainer/MarginContainer4/HBoxContainer2/Magnitude
@onready var CardText = $Panel/MarginContainer/VBoxContainer/MarginContainer5/CardTextLabel

var vector

func initialize_card(direction, magnitude):
    Direction.text = direction
    Magnitude.text = magnitude
    
    vector = Vector2(float(direction), float(magnitude))
    
    # todo programatically decide image, name and text based on vector
