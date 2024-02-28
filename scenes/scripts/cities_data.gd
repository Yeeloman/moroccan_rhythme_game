extends Node

var selected_city: String

var cities = {
	"warzazat" = {
		"track_1" = {
			##### section for navigation ######
			"place_pic" = preload("res://assets/bimo.png"),
			"desc" = " Ouarzazate possesses captivating tours blending history, culture, and natural beauty , and venture into the Atlas Mountains or Sahara Desert for adventure. Each tour promises an unforgettable experience in this enchanting destination. 
",
			##### section for in game ######
			"song" = preload("res://assets/songs/test.mp3"),
			"midi" = "res://assets/songs/test.mid",
			"bg" = preload("res://assets/warzazat_bg.png")
		},
	},
	"merrakech" = {
		"track_1" = {
			##### section for navigation ######
			"place_pic" = preload("res://assets/kech.png"),
			"desc" = "The Koutoubia Mosque in Marrakech is a marvel!  a  true architectural beauty , its timeless grandness commands attention. A visit to this sacred site is sure to evoke a deep sense of wonder and serenity, as you stand in awe of its intricate details and historical significance.",
			##### section for in game ######
			"song" = preload("res://assets/songs/test.mp3"),
			"midi" = "res://assets/songs/test.mid",
			"bg" = preload("res://assets/image_2ddddd-export.png")
		},

},
	"casablanca" = {
		"track_1" = {
			##### section for navigation ######
			"place_pic" = preload("res://assets/hasann.png"),
			"desc" = "The Hassan II Mosque in Casablanca is absolutely breathtaking! 
Its grand architecture next to the beautiful blue ocean is simply mesmerizing. This sacred place will make you feel a profound sense of beauty and tranquility.",
			##### section for in game ######
			"song" = preload("res://assets/songs/test.mp3"),
			"midi" = "res://assets/songs/test.mid",
			"bg" = preload("res://assets/jama3.png")
		},
},
}
