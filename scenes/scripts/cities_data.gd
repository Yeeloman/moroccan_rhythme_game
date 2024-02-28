extends Node

var selected_city: String

var cities = {
	"warzazat" = {
		"track_1" = {
			##### section for navigation ######
			"place_pic" = preload("res://assets/bimo.png"),
			"desc" = "some description i assume and im trying to make it a bit long to test some stuff that ill forget about",
			##### section for in game ######
			"song" = preload("res://assets/songs/test.mp3"),
			"midi" = "res://assets/songs/test.mid",
			"bg" = preload("res://assets/warzazat_bg.png")
		},
	},
	"merrakech" = {},
	"casablanca" = {},
}
