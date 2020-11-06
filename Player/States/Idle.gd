extends State

func update(player: Player, _delta):
	player.velocity.x = 0;
	player.set_animation("Idle");
	player.update_facing();

func get_next_state(player: Player):
	var input = player.input;
	if (!player.is_on_floor()):
		return "InAir";
	if (input.Crouch):
		return "Crouch";
	if (input.Left || input.Right):
		return "Run";
	if (input.Jump):
		return "Jump";
	if (input.Attack):
		return "Attack";
	return .get_next_state(player);
