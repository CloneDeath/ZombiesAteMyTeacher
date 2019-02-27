extends KinematicBody2D

var velocity = Vector2(0, 0);
var walk_speed = 48;
var jump_speed = 175;
var up_gravity = 400;
var down_gravity = 200;
var facing = 1;
var already_jumped = false;

var input = PlayerInput.new();

func _process(delta):
	execute_movement(delta);
	execute_attacks();
	execute_animation_update();
	execute_facing_update();

func execute_movement(delta):
	if (input.Fall):
		already_jumped = false;
	if (is_on_floor() && input.Jump && !already_jumped && !is_attacking()):
		$Animation.play("jump");
		already_jumped = true;
	if (velocity.y < 0 && input.Fall):
		velocity.y = 0;
	if (!is_attacking() || !is_on_floor()):
		velocity.x = (int(input.Right)-int(input.Left)) * walk_speed;
	else:
		velocity.x = 0;
	if (velocity.y < 0):
		velocity.y += up_gravity * delta;
	else:
		velocity.y += down_gravity * delta;
	velocity = self.move_and_slide(velocity, Vector2(0, -1));

func do_jump():
	velocity.y = -jump_speed;

func execute_attacks():
	if (input.Attack && !is_attacking()):
		set_animation("attack-knife");

func is_attacking():
	return $Animation.current_animation == "attack-knife";

func is_on_floor():
	return $Sprite/GroundDetector.get_overlapping_bodies().size() > 0;

func execute_animation_update():
	if (is_attacking()): return;
	if (is_on_floor()):
		if (input.Left == input.Right):
			set_animation("idle");
		else:
			set_animation("run");
	else:
		set_animation("jump");

func set_animation(animation):
	if ($Animation.current_animation == animation): return;
	$Animation.play(animation);

func execute_facing_update():
	if (is_attacking()): return;
	if (input.Left != input.Right):
		facing = 1 if input.Right else -1;
	$Sprite.scale.x = facing;