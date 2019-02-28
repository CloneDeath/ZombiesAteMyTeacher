extends Node
class_name SoulFragment

var level = 0;
var xp = 0;

func increment():
	xp += 1;
	if (xp >= 10):
		level += 1;
		xp -= 10;
		on_level_up();

func on_level_up():
	pass;