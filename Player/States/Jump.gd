extends State

func on_enter(player: Player):
	player.set_animation("Jump");
	player.velocity.x = 0;

func get_next_state(player: Player):
	var animation = player.get_node("Animation") as AnimationPlayer;
	if (!animation.is_playing()):
		return "InAir";
	return .get_next_state(player);