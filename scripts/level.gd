extends Control

@onready var Character = $Character
@onready var camera = $Character/Camera2D
@onready var hud = $CanvasLayer/HUD
@onready var submit_button = $CanvasLayer/HUD/VBoxContainer/SubmitMarginContainer4/SubmitVBoxContainer/SubmitButton

@onready var VPath = $VPath2D
@onready var VPathFollow = $VPath2D/VPathFollow2D
@onready var HPath = $VPath2D/VPathFollow2D/HPath2D2
@onready var HPathFollow = $VPath2D/VPathFollow2D/HPath2D2/HPathFollow2D
@onready var Goal = $Goal

@onready var Platform = preload("res://scenes/obstacle.tscn")
@onready var Pickup = preload("res://scenes/pickup.tscn")

const PLATFORM_COUNT = 20


func _ready():
	var callable = Callable(self, "_on_submit_button_pressed")
	var goalCallable = Callable(self, "_on_goal_entered")
	
	hud.connect("submit_button_pressed", callable)
#    Pickup.connect("pickup_entered", pickupCallable)
	Goal.connect("goal_entered", goalCallable)

	camera_setup()
	make_platforms()
	
func make_platforms():
	VPathFollow.rotation = false
	HPathFollow.rotation = false
	
	var i = 0
	while i < PLATFORM_COUNT:
				
		VPathFollow.progress_ratio=float(i) / max(1, float(PLATFORM_COUNT - 1))
		HPathFollow.global_position = VPathFollow.global_transform.origin
#        platformInstance.global_position = VPathFollow.global_transform.origin
				
		for n in randi_range(1,2):
			var platformInstance = Platform.instantiate()
			VPath.add_child(platformInstance)
			
			HPathFollow.progress_ratio= randf_range(0,1)
			platformInstance.global_position = HPathFollow.global_transform.origin
			
			if randf() < 0.5:
				var pickupCallable = Callable(self, "_on_pickup_entered")

				var pickupInstance = Pickup.instantiate()
				VPath.add_child(pickupInstance)
				pickupInstance.global_position = platformInstance.global_position + Vector2(0, -100)
				pickupInstance.connect("pickup_entered", pickupCallable)
		i+=1
	
	VPathFollow.progress_ratio=1
	Goal.global_position = VPathFollow.global_transform.origin

		
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
	
func _on_goal_entered(_goal):
	Global.goto_scene("res://victory.tscn")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
