extends KinematicBody2D

export(int, -1, 1, 2) var facing = 1;

func damage(_amount):
	$CPUParticles2D.emitting = true;

func _physics_process(delta):
	var collided = move_and_collide(Vector2(facing*10*delta, 0));
	if (collided):
		facing *= -1;
	$Sprite.scale.x = facing;