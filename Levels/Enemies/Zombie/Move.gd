extends State

func update(entity, delta):
	var velocity = Vector2(entity.facing*10*delta, 0);
	var collided = entity.move_and_collide(velocity);
	if (collided):
		entity.facing *= -1;