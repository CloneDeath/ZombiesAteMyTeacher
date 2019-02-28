extends "res://Levels/Enemies/BaseEnemy.gd"
tool

export(int, -1, 1, 2) var facing = 1;

func damage(amount):
	.damage(amount);
	$StateMachine.transition_to_state("Damaged");

func _physics_process(_delta):
	$Sprite.scale.x = facing;