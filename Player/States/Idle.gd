extends BaseState

func update(player: Player, _input: PlayerInput):
	player.velocity.x = 0;
	player.set_animation("Idle");

func get_next_state(player: Player, input: PlayerInput):
	if (!player.is_on_floor()):
		return "InAir";
	if (input.Left || input.Right):
		return "Run";
	if (input.Jump):
		return "Jump";
	if (input.Attack):
		return "Attack";
	return .get_next_state(player, input);