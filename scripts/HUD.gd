extends Control

signal submit_button_pressed(vector)

var directionTextEditor
var magnitudeTextEditor


# Called when the node enters the scene tree for the first time.
func _ready():
    pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    pass


func _on_button_pressed():
    var dir = float($VBoxContainer/MagMarginContainer/VBoxContainer/DirTextEdit.get_text())
    var mag = float($VBoxContainer/MagMarginContainer2/MagVBoxContainer/MagTextEdit.get_text())
    emit_signal("submit_button_pressed", Vector2(dir, abs(mag)*-1))
