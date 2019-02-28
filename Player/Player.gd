extends KinematicBody2D
class_name Player

var experience = 0;

var velocity = Vector2(0, 0);
var jump_speed = 175;
var up_gravity = 400;
var down_gravity = 200;
var facing = 1;

var input = PlayerInput.new();

func _process(delta):
	input.update(delta);
	update_physics(delta);

func update_physics(delta):
	if (velocity.y < 0):
		velocity.y += up_gravity * delta;
	else:
		velocity.y += down_gravity * delta;
	velocity = self.move_and_slide(velocity, Vector2(0, -1));

func do_jump():
	velocity.y = -jump_speed;

func is_on_floor():
	return $Sprite/GroundDetector.get_overlapping_bodies().size() > 0;

func set_animation(animation):
	if ($Animation.current_animation == animation): return;
	$Animation.play(animation);

func update_facing():
	if (input.Left != input.Right):
		facing = 1 if input.Right else -1;
	$Sprite.scale.x = facing;

func give_xp(xp):
	self.experience += xp;