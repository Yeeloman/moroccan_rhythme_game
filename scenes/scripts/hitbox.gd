extends Node2D

signal bad(bad_score: int)
signal good(good_score: int)
signal great(great_score: int)
signal miss(miss_score: int)

@onready var touched = %TouchScreenButton

func _ready():
	Sig.connect("pause", func ():
		%TouchScreenButton.visible = false)
	Sig.connect("unpause", func ():
		%TouchScreenButton.visible = true)
	pass # Replace with function body.



func _process(_delta):
	if touched.is_pressed():
		if self['metadata/score'] <= 5:
			bad.emit(-25)
			#print('bad')
		elif self['metadata/score'] <= 8:
			good.emit(25)
			#print('good')
		elif self['metadata/score'] <= 10:
			emit_signal("great", 75)
			#print('great')
		queue_free()
	rotate_hitboxes()
	pass

func rotate_hitboxes():
	%hitbox_texture.rotation -= 0.01
	%outline.rotation += 0.01
	pass
func _queue_free():
	miss.emit(-20)
	touched.pressed.emit()
	queue_free()
	pass
