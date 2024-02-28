extends Control

@export var level_game: PackedScene
@export var main_menu: PackedScene
@export var city_nav: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	_scene_unpacker(main_menu)
	signal_listener()
	pass # Replace with function body.


func signal_listener():
	Sig.connect('start', load_scene)
	Sig.connect('lunch_game', _scene_unpacker.bind(level_game))


func load_scene():
	_scene_unpacker(city_nav)


# unpack the scenes and add them to the root
func _scene_unpacker(packed_scene: PackedScene):
	var unpacked_scene = packed_scene.instantiate()
	add_child(unpacked_scene)
	pass 
