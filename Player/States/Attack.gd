extends State

const run_speed = 48;

func on_enter(player: Player):
	player.set_animation("Attack-Knife");
	player.velocity.x = 0;

func update(player: Player, _delta):
	if (player.is_on_floor()):
		player.velocity.x = 0;
	else:
		var input = player.input;
		var velocity = int(input.Right) - int(input.Left);
		player.velocity.x = velocity * run_speed;

func get_next_state(player: Player):
	var animation = player.get_node("Animation") as AnimationPlayer;
	if (!animation.is_playing()):
		return "Idle";
	return .get_next_state(player);
