extends BaseState

const run_speed = 48;

func update(player: Player, input: PlayerInput):
	var velocity = (int(input.Right)-int(input.Left));
	player.velocity.x = velocity * run_speed;
	player.set_animation("Run");
	player.update_facing();

func get_next_state(player: Player, input: PlayerInput):
	if (!player.is_on_floor()):
		return "InAir";
	if (!input.Left && !input.Right):
		return "Idle";
	if (input.Jump):
		return "Jump";
	if (input.Attack):
		return "Attack";
	return .get_next_state(player, input);
