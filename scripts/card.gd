extends Control

@onready var NameLabel = $Panel/MarginContainer/VBoxContainer/MarginContainer/NameLabel
@onready var CardImage = $Panel/MarginContainer/VBoxContainer/MarginContainer2/ImageBG/MarginContainer/TextureRect
@onready var Direction = $Panel/MarginContainer/VBoxContainer/MarginContainer3/HBoxContainer/Direction
@onready var Magnitude = $Panel/MarginContainer/VBoxContainer/MarginContainer4/HBoxContainer2/Magnitude
@onready var CardText = $Panel/MarginContainer/VBoxContainer/MarginContainer5/CardTextLabel

var vector

func initialize_card(direction, magnitude):
    Direction.text = str(direction)
    Magnitude.text = str(magnitude)

    vector = Vector2(float(direction), float(magnitude))

func _ready():
    initialize_card(1,2)
        
# todo programatically decide image, name and text based on vector
