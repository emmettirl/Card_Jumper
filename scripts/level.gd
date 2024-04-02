extends Control

@onready var Character = $Character
@onready var Pickup = $pickup
@onready var camera = $Character/Camera2D
@onready var hud = $CanvasLayer/HUD

func _ready():
    var callable = Callable(self, "_on_submit_button_pressed")
    var pickupCallable = Callable(self, "_on_pickup_entered")
    
    hud.connect("submit_button_pressed", callable)
    Pickup.connect("pickup_entered", pickupCallable)

    camera_setup()
    
func camera_setup():
    camera.make_current()
    camera.set_drag_margin(SIDE_TOP, 0.2)
    camera.set_drag_margin(SIDE_BOTTOM, 0.2)
    
    camera.drag_vertical_enabled = true
    camera.drag_vertical_offset = 0.2
    
    camera.position_smoothing_enabled = true
    camera.position_smoothing_speed = 5.0
    
    camera.set_limit(SIDE_LEFT, 0)
    camera.set_limit(SIDE_RIGHT, get_viewport().get_visible_rect().size.x)

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
