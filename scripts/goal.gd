extends Area2D

signal goal_entered

# Called when the node enters the scene tree for the first time.
func _ready():
    pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
    pass

func _on_body_entered(body):
    print(body.name)
    # Check if the body is the player
    if body.name == "Character":
        emit_signal("goal_entered", self)
