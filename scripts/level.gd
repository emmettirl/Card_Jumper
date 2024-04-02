extends Control

@onready var hud = $HUD
@onready var Character = $Character
@onready var Pickup = $pickup

# Called when the node enters the scene tree for the first time.
func _ready():
    var callable = Callable(self, "_on_submit_button_pressed")
    var pickupCallable = Callable(self, "_on_pickup_entered")

    hud.connect("submit_button_pressed", callable)
    Pickup.connect("pickup_entered", pickupCallable)
    
func _on_submit_button_pressed(vector):
    print("Submit button pressed: " + str(vector))
#    Character.velocity.x = vector.x
    Character.jump(vector)
    
func _on_pickup_entered(_pickup):
    print("pickup")
    hud.updateTurnCount(-1)
    
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
    pass
