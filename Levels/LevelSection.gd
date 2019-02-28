extends Node
tool

export(Rect2) var Cells = Rect2(0, 0, 1, 1);
var unit_cell = Vector2(208, 128);

func get_cell_size():
	return Cells.size * unit_cell;

func get_cell_position():
	return Cells.position * unit_cell;

func update_bounds():
	$Camera.limit_left = get_cell_position().x;
	$Camera.limit_right = get_cell_position().x + get_cell_size().x;
	$Camera.limit_top = get_cell_position().y;
	$Camera.limit_bottom = get_cell_position().y + get_cell_size().y;

func _ready():
	update_bounds();

func _process(_delta):
	if (Engine.editor_hint):
		update_bounds();
		return;
	activate_camera();

func activate_camera():
	var players = get_tree().get_nodes_in_group("player");
	if (players.size() == 0):
		return;
	var player = players[0];
	$Camera.position.x = player.position.x;
	$Camera.position.y = player.position.y - 32;
	if (is_in_camera_limit(player.position)):
		if (!$Camera.current):
			for enemy in get_tree().get_nodes_in_group("enemy"):
				if (is_in_camera_limit(enemy.initial_position)):
					enemy.respawn();
				else:
					enemy.disable();
		$Camera.current = true;
	else:
		$Camera.current = false;

func is_in_camera_limit(point):
	if (point.x < $Camera.limit_left): return false;
	if (point.x > $Camera.limit_right): return false;
	if (point.y < $Camera.limit_top): return false;
	if (point.y > $Camera.limit_bottom): return false;
	return true;