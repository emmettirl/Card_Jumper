extends Control

signal submit_button_pressed(vector)

@onready var Path = $HandPath
@onready var PathFollow = $HandPath/PathFollow2D
@onready var Hand = Array()

const STARTING_HAND_SIZE = 5

var directionTextEditor
var magnitudeTextEditor
var Deck = preload("res://deck.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
    
    var deckInstance = Deck.instantiate()
    add_child(deckInstance)
    
    for i in STARTING_HAND_SIZE:
        var card = deckInstance.drawCard()
        Hand.append(card)
        Path.add_child(card)
    
    update_hand_pos()
        
    pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
    pass


func _on_button_pressed():
    var dir = float($VBoxContainer/MagMarginContainer/VBoxContainer/DirTextEdit.get_text())
    var mag = float($VBoxContainer/MagMarginContainer2/MagVBoxContainer/MagTextEdit.get_text())
    emit_signal("submit_button_pressed", Vector2(dir, abs(mag)*-1))
    
func update_hand_pos():
    var handsize = len(Hand)    
    var i = 0
    
    for card in Hand:
        PathFollow.progress_ratio=(float(i)/float(handsize))

        #card.position = Vector2(PathFollow.h_offset, PathFollow.v_offset)
        card.scale = Vector2(0.6, 0.6)
        card.global_position = PathFollow.global_transform.origin

        card.global_position.y -= 50
        #card.global_position.x -= 50
        i+=1
    
