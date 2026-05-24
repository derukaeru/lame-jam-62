extends Node

var UID: Dictionary = {
	"loading_screen": "uid://tetiuyj7kfoe",
	"splash_screen": "uid://b4ggbq71lpwo4",
	"title_screen": "uid://dix67ojrdr6ht",
	"pause_screen": "uid://7jemke30bxqq",
	"main": "uid://ciymvwvc32apb",
	
	"club_stamp": "uid://xhht0hei3d8v",
	"diamond_stamp": "uid://s45v8byw4uca",
	"heart_stamp": "uid://dd04lqi4s63qw"
}

var papers: Dictionary = {
	"title": "content"
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
	"5. Papers with \"riot\", \"protest\", or \"unrest\" are banned.\n6. Foreign articles require a Heart stamp.\n7. Photos with 5 people needs to be removed.\n"],
	["1. Remove all articles with a Club stamp.\n2. Remove any article mentioning X \n3. Ignore Rule 1 if paper has a diamond stamp\n4. Kill any paper with unnamed sources.", 
	"5. Papers with \"riot\", \"protest\", or \"unrest\" are banned.\n6. Foreign articles require a Heart stamp.\n7. Photos with 5 people needs to be removed.\n8. Remove any article  by Reporter (name). No Exceptions."],
]
