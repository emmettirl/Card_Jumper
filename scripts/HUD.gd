extends Control

signal submit_button_pressed(vector)

@onready var Path = $HandPath
@onready var PathFollow = $HandPath/PathFollow2D
@onready var MoveCountLabel = $VBoxContainer/TrunCountMarginContainer3/HBoxContainer/moveCount

@onready var deckInstance = Deck.instantiate()
@onready var TurnCount = 0


const STARTING_HAND_SIZE = 5

var Deck = preload("res://deck.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
    
    add_child(deckInstance)
    fill_hand(deckInstance)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
    pass


func _on_button_pressed():
    var vector = Vector2(0,0) 
    var cards_to_remove = Array()
    
    for card in deckInstance.HandArray:
        if card.Selected:
            vector += card.vector
            cards_to_remove.append(card)

    for card in cards_to_remove:
        card.Hovered = false
        card.Selected = false
        deckInstance.HandArray.erase(card)
        Path.remove_child(card)
        deckInstance.discardArray.append(card)
    
    fill_hand(deckInstance)
    
    TurnCount += 1
    MoveCountLabel.text = str(TurnCount)
                
    emit_signal("submit_button_pressed", vector)

    
func update_hand_pos():
    var handsize = len(deckInstance.HandArray)    
    var i = 0
    
    for card in deckInstance.HandArray:
        PathFollow.progress_ratio=(float(i)/float(handsize))
        card.global_position = PathFollow.global_transform.origin
        card.global_position.y -= 50
        i+=1
    
func fill_hand(deckInst):
    while deckInstance.HandArray.size() < STARTING_HAND_SIZE:
        var card = deckInst.drawCard()
        deckInstance.HandArray.append(card)
        Path.add_child(card)
    
    update_hand_pos()
