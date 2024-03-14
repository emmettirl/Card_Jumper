extends Control

@onready var hud = $HUD
var Character

# Called when the node enters the scene tree for the first time.
func _ready():
    Character = get_node("Character")
    
    var callable = Callable(self, "_on_submit_button_pressed")

    hud.connect("submit_button_pressed", callable)
    
func _on_submit_button_pressed(vector):
    print("Submit button pressed: " + str(vector))
    Character.velocity = vector


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    pass
