extends Node2D

@onready var deckArray = Array()

# Called when the node enters the scene tree for the first time.
func _ready():
    
    var cardScene = preload("res://scenes/card.tscn")
    
    for i in 10:
        var card = cardScene.instantiate()
        deckArray.append(card)

    deckArray.shuffle()

func drawCard():
    print("")
    var card = deckArray.pop_front()
    return card
