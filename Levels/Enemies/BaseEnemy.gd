extends KinematicBody2D
var float_text_scene = load("res://Engine/FloatingNumber/FloatingNumber.tscn");

var Health;
export var MaxHealth = 1;
export var XpValue = 1;

var initial_position;

func _ready():
	initial_position = position;
	respawn();

func respawn():
	Health = MaxHealth;
	position = initial_position;
	$Sprite.visible = true;
	$CollisionShape2D.disabled = false;

func damage(amount):
	var damage = float_text_scene.instance();
	damage.value = amount;
	$DamageNumberSpawn.add_child(damage);
	Health -= 1;
	if (Health < MaxHealth):
		kill();

func kill():
	disable();
	for player in get_tree().get_nodes_in_group("player"):
		player.give_xp(XpValue);

func disable():
	$Sprite.visible = false;
	$CollisionShape2D.disabled = true;