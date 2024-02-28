extends Node2D



func _ready():
	Sig.connect('start', func ():
		hide())
	pass



func _process(delta):
	pass


#quits the game
func _on_quit_button_pressed():
	get_tree().quit()


# starts the game
func _on_start_button_pressed():
	#%AnimationPlayer.play('trans')
	#await get_tree().create_timer(0.5).timeout
	Sig.start.emit()
	pass # Replace with function body.
