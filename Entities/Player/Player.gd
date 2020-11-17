extends BaseEntity
class_name Player

var health;
var max_health setget ,get_max_health;
func get_max_health(): return 1 + $SoulFragments/Zombie.level;
var velocity = Vector2(0, 0);
var jump_speed = 175;
var up_gravity = 400;
var down_gravity = 200;
var facing = 1;
var invulnerable = 0;

var input = PlayerInput.new();

func _ready():
	health = self.max_health;

func _process(delta):
	update_vulnerability(delta);
	input.update(delta);
	update_physics(delta);
	take_damage();

func update_vulnerability(delta):
	invulnerable -= delta;
	if (invulnerable <= 0):
		invulnerable = 0;

func update_physics(delta):
	if (velocity.y < 0):
		velocity.y += up_gravity * delta;
	else:
		velocity.y += down_gravity * delta;
	velocity = self.move_and_slide(velocity, Vector2(0, -1));
	if (is_on_floor()):
		var friction = pow(0.1, delta);
		velocity.x = velocity.x * friction;

func take_damage():
	if (!can_take_damage()): return;
	for body in $EnemyCollision.get_overlapping_bodies():
		if (body.is_in_group("enemy")):
			self.damage(body, 1);

func damage(source, amount):
	if (!can_take_damage()): return;
	self.health -= amount;
	if (self.health <= 0):
		self.health = 0;
		$StateMachine.transition_to_state("Dead");
		return;
	invulnerable = 3;
	$StateMachine.transition_to_state("Damaged");
	var vel_sign = sign(self.position.x - source.position.x);
	self.velocity.x = vel_sign * 50;

func can_take_damage():
	return invulnerable <= 0;

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

func give_soul_fragment(soul):
	$SoulFragments.get_node(soul).increment();

func allow_fall_through(mode):
	set_collision_mask_bit(3, !mode);
	$Sprite/GroundDetector.set_collision_mask_bit(3, !mode);
