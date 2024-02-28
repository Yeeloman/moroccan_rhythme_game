extends VBoxContainer

@export var menu_layer: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	Sig.connect("populate", _populate_menu.bind(menu_layer))
	pass # Replace with function body.


func _populate_menu(packed_scene:PackedScene):
	var city = CD.selected_city
	for track_name in CD.cities[city]:
		var track = CD.cities[city][track_name]
		var unpacked_scene =  packed_scene.instantiate()
		unpacked_scene.get_node("%place_pic").texture = track["place_pic"]
		unpacked_scene.get_node("%desc").text = track["desc"]
		add_child(unpacked_scene)


func _process(delta):
	pass
