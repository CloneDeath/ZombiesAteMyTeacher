extends State

func on_enter(entity):
	entity.get_node("Animation").play("Damaged");

func get_next_state(entity):
	var animation = entity.get_node("Animation") as AnimationPlayer;
	if (!animation.is_playing()):
		return "Move";
	return null;