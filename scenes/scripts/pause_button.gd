extends Node2D


func _ready():
	pass


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
