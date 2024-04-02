extends Control

signal submit_button_pressed(vector)

@onready var Path = $HandPath
@onready var PathFollow = $HandPath/PathFollow2D
@onready var MoveCountLabel = $VBoxContainer/TrunCountMarginContainer3/HBoxContainer/moveCount

@onready var deckInstance = Deck.instantiate()
@onready var TurnCount = 0


const STARTING_HAND_SIZE = 5

var Deck = preload("res://scenes/deck.tscn")


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
    
    updateTurnCount(1)
                
    emit_signal("submit_button_pressed", vector)

func updateTurnCount(i):
    TurnCount += i
    MoveCountLabel.text = str(TurnCount)
    
func update_hand_pos():
    var handsize = len(deckInstance.HandArray)    
    var i = 0
    
    for card in deckInstance.HandArray:
        PathFollow.rotation = false
        PathFollow.progress_ratio=float(i) / max(1, float(handsize - 1))
        card.global_position = PathFollow.global_transform.origin
        
        var cardRect = card.get_node("Panel").get_rect()
        card.global_position.x -= (cardRect.size.x * card.scale.x) / 2
        card.global_position.y -= (cardRect.size.y * card.scale.y) / 2
        i+=1
    
func fill_hand(deckInst):
    while deckInstance.HandArray.size() < STARTING_HAND_SIZE:
        var card = deckInst.drawCard()
        deckInstance.HandArray.append(card)
        Path.add_child(card)
    
    update_hand_pos()
