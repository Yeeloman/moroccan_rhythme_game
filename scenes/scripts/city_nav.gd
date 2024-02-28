extends Control



func _ready():
	Sig.connect("lunch_game", func ():
		hide())
	pass # Replace with function body.



func _process(delta):
	pass


func _on_casablanca_pressed():
	if %menu.position.x == -650:
		CD.selected_city = "casablanca"
		Sig.populate.emit()
		%back.show()
		%menu_animation.play("slide_in")


func _on_warzazat_pressed():
	if %menu.position.x == -650:
		CD.selected_city = "warzazat"
		Sig.populate.emit()
		%back.show()
		%menu_animation.play("slide_in")


func _on_merrakch_pressed():
	if %menu.position.x == -650:
		CD.selected_city = "merrakech"
		Sig.populate.emit()
		%back.show()
		%menu_animation.play("slide_in")



func _on_touch_screen_button_pressed():
	if %menu.position.x == 38:
		%menu_animation.play("slideout")
	%back.hide()
