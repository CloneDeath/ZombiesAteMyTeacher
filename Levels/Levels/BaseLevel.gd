extends TileMap

func _process(_delta):
	$HUD/Xp/Value.text = str($Player.experience);