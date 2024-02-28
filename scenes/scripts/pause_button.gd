extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_touch_screen_button_pressed():
	if !self["metadata/pause"]:
		Engine.time_scale = 0
		self["metadata/pause"] = true
		Sig.emit_signal("pause")
	else:
		Engine.time_scale = 1
		self["metadata/pause"] = false
		Sig.emit_signal("unpause")
