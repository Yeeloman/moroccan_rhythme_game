extends Control

@export var player: PackedScene
@export var hitbox: PackedScene
@export var pause_button: PackedScene

@onready var spawner_array: Array[Node2D] = [
	%major_1,
	%l_major_2,
	%l_major_3,
	%l_major_4,
	%minor_1,
	%r_minor_2,
	%r_minor_3,
	%r_minor_4,
	%centered
]
@onready var spawner_len: int = spawner_array.size()
@onready var progress: TextureProgressBar = %ProgressBar

func _ready():
	#_scene_unpacker(player)
	_scene_unpacker(pause_button, %pause)
	_set_up_track()
	test_sync()

func _set_up_track():
	var city = CD.selected_city
	for track_name in CD.cities[city]:
		var track = CD.cities[city][track_name]
		%background.texture = track["bg"]
		%MidiPlayer.file = track['midi']
		%audio_player.stream = track['song']
	pass


func test_sync():
	%MidiPlayer.play()
	%audio_player.play()


# spawns the beats
func _create_beat(spawner: Node2D, packed_scene: PackedScene,) -> void:
	var temp
	if !spawner["metadata/in_use"]:
		var unpacked_scene = packed_scene.instantiate()
		spawner.add_child(unpacked_scene)
		spawner["metadata/in_use"] = true
		temp = unpacked_scene
	if temp:
		temp.get_node("%TouchScreenButton").connect('pressed', change_in_use.bind(spawner))
		signal_listener(temp)

#listens to the incomming connections from hitbox
func signal_listener(hitbox: Node2D) -> void:
	#handle pause_game
	Sig.connect('pause', _pause_game)
	Sig.connect('unpause', _unpause_game)

	hitbox.connect('bad', calculate_score)
	hitbox.connect('good', calculate_score)
	hitbox.connect('great', calculate_score)
	hitbox.connect('miss', calculate_score)
	pass

func calculate_score(score_points: int) -> void:
	progress.value += score_points
	pass

# empty the in use slot so another beat spawns
func change_in_use(spawner: Node2D) -> void:
	spawner["metadata/in_use"] = false

# unpack the scenes and add them to the root
func _scene_unpacker(packed_scene: PackedScene, targetNode = null):
	if targetNode == null:
		targetNode = self
	var unpacked_scene = packed_scene.instantiate()
	targetNode.add_child(unpacked_scene)
	pass 


func _pause_game():
	%audio_player.stream_paused = true
	%MidiPlayer.play_speed = 0
	%pause_filter.visible = true
	%ProgressBar.visible = false
func _unpause_game():
	%pause_filter.visible = false
	%ProgressBar.visible = true
	%audio_player.stream_paused = false
	%MidiPlayer.play_speed = 1

# connects midi beat events with creating hitboxes
func _on_midi_player_midi_event(channel, event):
	if randi() % (10 - 0) < 3:
		var rand_index = randi() % spawner_len
		_create_beat(spawner_array[rand_index], hitbox)
