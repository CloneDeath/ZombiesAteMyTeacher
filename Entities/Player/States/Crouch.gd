extends State

func on_enter(player):
	player.set_animation("Crouch");
	player.velocity.x = 0;

func update(player: Player, _delta):
	var input = player.input;
	if (input.Jump):
		player.allow_fall_through(true);

func get_next_state(player):
	var input = player.input;
	if (!player.is_on_floor()):
		return "InAir";
	if (!input.Crouch):
		return "Idle";
	return null;
