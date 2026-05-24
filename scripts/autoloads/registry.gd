extends Node

var UID: Dictionary = {
	"loading_screen": "uid://tetiuyj7kfoe",
	"splash_screen": "uid://b4ggbq71lpwo4",
	"title_screen": "uid://dix67ojrdr6ht",
	"pause_screen": "uid://7jemke30bxqq",
	"end_day_screen": "uid://bpsa3xpowqm02",
	"main": "uid://ciymvwvc32apb",
	
	"club_stamp": "uid://xhht0hei3d8v",
	"diamond_stamp": "uid://s45v8byw4uca",
	"heart_stamp": "uid://dd04lqi4s63qw",
	"spade_stamp": "uid://cat23bnw5fccq",
	
	"paper": "uid://cr10ay5yhae77",
	"guide": "uid://cf4uexday8p2d"
}

var papers: Dictionary = {
	"tainted": {
		"club_stamp": [["",""],["",""],["",""],],
		"bad_topic": [["",""],["",""],["",""],],
		"unnamed_sources": [["",""],["",""],["",""],],
		"banned_words": [["",""],["",""],["",""],],
		"foreign": [["",""],["",""],["",""],],
		"by_reporter": [["",""],["",""],["",""],]
	},
	"clean": [
		["title", "content"],
		["title", "content"],
		["title", "content"],
		["title", "content"],
		["title", "content"],
		["title", "content"],
	]
	
}

var guide: Array = [
	["1. Remove all articles with a Club stamp.", ""],
	["1. Remove all articles with a Club stamp.\n2. Remove any article mentioning X", ""],
	["1. Remove all articles with a Club stamp.\n2. Remove any article mentioning X \n3. Ignore Rule 1 if paper has a diamond stamp\n4. Kill any paper with unnamed sources.", ""],
	["1. Remove all articles with a Club stamp.\n2. Remove any article mentioning X \n3. Ignore Rule 1 if paper has a diamond stamp\n4. Kill any paper with unnamed sources.", 
	"5. Papers with \"riot\", \"protest\", or \"unrest\" are banned.\n6. Foreign articles require a Heart stamp.\n"],
	["1. Remove all articles with a Club stamp.\n2. Remove any article mentioning X \n3. Ignore Rule 1 if paper has a diamond stamp\n4. Kill any paper with unnamed sources.", 
	"5. Papers with \"riot\", \"protest\", or \"unrest\" are banned.\n6. Foreign articles require a Heart stamp.\n"],
	["1. Remove all articles with a Club stamp.\n2. Remove any article mentioning X \n3. Ignore Rule 1 if paper has a diamond stamp\n4. Kill any paper with unnamed sources.", 
	"5. Papers with \"riot\", \"protest\", or \"unrest\" are banned.\n6. Foreign articles require a Heart stamp.\n7. Override all rules preceding if paper has Spade stamp.\n"],
	["1. Remove all articles with a Club stamp.\n2. Remove any article mentioning X \n3. Ignore Rule 1 if paper has a diamond stamp\n4. Kill any paper with unnamed sources.", 
	"5. Papers with \"riot\", \"protest\", or \"unrest\" are banned.\n6. Foreign articles require a Heart stamp.\n7. Override all rules preceding if paper has Spade stamp.\n8. Remove any article  by Reporter (name). No Exceptions."],
]
