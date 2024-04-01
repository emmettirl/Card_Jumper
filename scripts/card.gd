extends Control

@onready var NameLabel = $Panel/MarginContainer/VBoxContainer/MarginContainer/NameLabel
@onready var CardImage = $Panel/MarginContainer/VBoxContainer/MarginContainer2/ImageBG/MarginContainer/TextureRect
@onready var Direction = $Panel/MarginContainer/VBoxContainer/MarginContainer3/HBoxContainer/Direction
@onready var Magnitude = $Panel/MarginContainer/VBoxContainer/MarginContainer4/HBoxContainer2/Magnitude
@onready var CardText = $Panel/MarginContainer/VBoxContainer/MarginContainer5/CardTextLabel
@onready var Hovered = false
@onready var Selected = false

var vector

func initialize_card(direction, magnitude):
    Direction.text = str(direction)
    Magnitude.text = str(abs(magnitude))

    vector = Vector2(float(direction), float(abs(magnitude)*-1))

func random_init():
    var rng = RandomNumberGenerator.new()
    initialize_card(int(rng.randf_range(-500, 500)), int(rng.randf_range(-500, 500)))

func _ready():
    #initialize_card(1,2)
    random_init()
 
func _process(_delta):
    if Selected:
        scale = Vector2(0.8,0.8) 
    elif Hovered:
        scale = Vector2(0.7,0.7)
    else:
        scale = Vector2(0.6, 0.6)


func _on_panel_mouse_entered():
    Hovered = true


func _on_panel_mouse_exited():
    Hovered = false


func _on_panel_gui_input(event):
    if event is InputEventMouseButton:
        if event.is_pressed() and event.button_index == MOUSE_BUTTON_LEFT:
            if Selected == false:
                Selected = true
            elif Selected == true:
                Selected = false
    
