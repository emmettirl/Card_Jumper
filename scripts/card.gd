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
    
    if direction >= 100 and direction < 300:
        CardImage.texture = load("res://images/arrow-topright.png")
    elif direction <= -100 and direction > -300:
        CardImage.texture = load("res://images/arrow-topleft.png")
    else:
        CardImage.texture = load("res://images/up-arrow.png")
    
    if direction >=300:
        CardImage.rotate(1.5708)
    elif direction <=-300:
        CardImage.rotate(-1.5708)
    
    if abs(magnitude) > 400:
        CardImage.scale*=2.25
    elif abs(magnitude) > 300:
        CardImage.scale*=1.5
    elif abs(magnitude) > 200:
        CardImage.scale*=1.25
    elif abs(magnitude) < 100:
        CardImage.scale*=0.5
    


func random_init():
    var rng = RandomNumberGenerator.new()
    initialize_card(int(rng.randf_range(-500, 500)), int(rng.randf_range(-500, 500)))

func _ready():
    #initialize_card(1,2)
    scale = Vector2(0.5, 0.5)
    random_init()
 
func _process(_delta):
    var old_scale = scale
    if Selected:
        scale = Vector2(0.7,0.7) 
        modulate = Color(1,1,1,0.75)
    elif Hovered:
        scale = Vector2(0.6,0.6)
    else:
        scale = Vector2(0.5, 0.5)
        modulate = Color(1,1,1,0.4)
    
    if Hovered:
        modulate = Color(1,1,1,1)


    if old_scale != scale:
        var cardRect = get_node("Panel").get_rect()
        position.x += (cardRect.size.x * old_scale.x - cardRect.size.x * scale.x) / 2
        position.y += (cardRect.size.y * old_scale.y - cardRect.size.y * scale.y) / 2


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
    
