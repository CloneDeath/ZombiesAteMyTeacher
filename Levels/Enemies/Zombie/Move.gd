extends State

func on_enter(entity):
	var animation = entity.get_node("Animation") as AnimationPlayer;
	animation.play("Move");

func update(entity, delta):
	var velocity = Vector2(entity.facing*10*delta, 0);
	var collided = entity.move_and_collide(velocity);
	if (collided):
		entity.facing *= -1;