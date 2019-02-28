extends SoulFragment

func on_level_up():
	var player = get_node("../..");
	player.health = player.max_health;