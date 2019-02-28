extends TileMap

func _process(_delta):
	$HUD/Hp/Value.text = str($Player.health) + "/" + str($Player.max_health);