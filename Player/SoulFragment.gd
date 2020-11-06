extends Node
class_name SoulFragment

var xp_needed = [
	1, 2, 3, 5, 8, 13, 21, 34, 55
	#1, 2, 3, 5, 7, 10, 15, 20, 25
];

var level = 0;
var xp = 0;

func increment():
	xp += 1;
	if (level >= xp_needed.size()): return;
	var needed = xp_needed[level];
	if (xp >= needed):
		level += 1;
		xp -= needed;
		on_level_up();

func on_level_up():
	pass;
