extends BaseState

const run_speed = 48;

func update(player: Player, input: PlayerInput):
	if (player.velocity.y < 0 && input.Fall):
		player.velocity.y = 0;
	var velocity = (int(input.Right)-int(input.Left));
	player.velocity.x = velocity * run_speed;
	player.set_animation("InAir");

func get_next_state(player: Player, input: PlayerInput):
	if (player.is_on_floor()):
		return "Idle";
	if (input.Attack):
		return "Attack";
	return .get_next_state(player, input);