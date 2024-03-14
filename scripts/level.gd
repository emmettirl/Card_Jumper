extends Control

@onready var hud = $HUD
@onready var Character = $Character

# Called when the node enters the scene tree for the first time.
func _ready():
    var callable = Callable(self, "_on_submit_button_pressed")

    hud.connect("submit_button_pressed", callable)
    
func _on_submit_button_pressed(vector):
    print("Submit button pressed: " + str(vector))
#    Character.velocity.x = vector.x
    Character.jump(vector)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    pass
