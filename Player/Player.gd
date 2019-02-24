extends KinematicBody2D

var velocity = Vector2(0, 0);
var walk_speed = 48;
var jump_speed = 175;
var up_gravity = 400;
var down_gravity = 200;
var facing = 1;
var already_jumped = false;

func _process(delta):
	execute_movement(delta);
	execute_animation_update();
	execute_facing_update();

func execute_movement(delta):
	var LEFT = Input.is_action_pressed("move_left");
	var RIGHT = Input.is_action_pressed("move_right");
	var JUMP = Input.is_action_pressed("move_jump");
	var FALL = !Input.is_action_pressed("move_jump");
	if (FALL):
		already_jumped = false;
	if (is_on_floor() && JUMP && !already_jumped):
		velocity.y = -jump_speed;
		already_jumped = true;
	if (velocity.y < 0 && FALL):
		velocity.y = 0;
	velocity.x = (int(RIGHT)-int(LEFT)) * walk_speed;
	if (velocity.y < 0):
		velocity.y += up_gravity * delta;
	else:
		velocity.y += down_gravity * delta;
	velocity = self.move_and_slide(velocity, Vector2(0, -1));

func is_on_floor():
	return $Sprite/GroundDetector.get_overlapping_bodies().size() > 0;

func execute_animation_update():
	var LEFT = Input.is_action_pressed("move_left");
	var RIGHT = Input.is_action_pressed("move_right");

	if (is_on_floor()):
		if (LEFT == RIGHT):
			set_animation("idle");
		else:
			set_animation("run");
	else:
		set_animation("jump");

func set_animation(animation):
	if ($Animation.current_animation == animation): return;
	$Animation.play(animation);

func execute_facing_update():
	var LEFT = Input.is_action_pressed("move_left");
	var RIGHT = Input.is_action_pressed("move_right");
	if (LEFT != RIGHT):
		facing = 1 if RIGHT else -1;
	$Sprite.scale.x = facing;