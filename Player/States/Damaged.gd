extends State

var damage_time = 0;

func on_enter(entity):
	damage_time = 0.5;
	entity.velocity.y = -50;

func update(entity, delta):
	damage_time -= delta;
	if (abs(entity.velocity.x) < 10):
		entity.velocity.x = 0;
	if (entity.is_on_floor()):
		entity.set_animation("Crouch");
	else:
		entity.set_animation("InAir");

func get_next_state(_entity):
	if (damage_time <= 0):
		return "Idle";
