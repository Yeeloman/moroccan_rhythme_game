extends VBoxContainer



func _ready():
	pass # Replace with function body.


func _process(delta):
	pass


func _on_touch_screen_button_pressed():
	#get_tree().change_scene_to_file("res://scenes/game_turn.tscn")
	Sig.emit_signal("lunch_game")
	pass # Replace with function body.
