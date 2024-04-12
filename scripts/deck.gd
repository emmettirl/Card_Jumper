extends Node2D

const DECK_SIZE = 40

@onready var deckArray = Array()
@onready var discardArray = Array()
@onready var HandArray = Array()

# Called when the node enters the scene tree for the first time.
func _ready():
	
	var cardScene = preload("res://scenes/card.tscn")
	
	for i in DECK_SIZE:
		var card = cardScene.instantiate()
		deckArray.append(card)

	deckArray.shuffle()

func drawCard():
	if deckArray.size()==0:
		print("shuffling discard into Deck")
		deckArray += discardArray
		discardArray.clear()
		deckArray.shuffle()
	
	var card = deckArray.pop_front()
	return card

