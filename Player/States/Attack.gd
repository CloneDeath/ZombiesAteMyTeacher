extends BaseState

func on_enter(player: Player):
	player.set_animation("Attack-Knife");
	player.velocity.x = 0;

func get_next_state(player: Player, input: PlayerInput):
	var animation = player.get_node("Animation") as AnimationPlayer;
	if (!animation.is_playing()):
		return "Idle";
	return .get_next_state(player, input);