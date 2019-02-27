extends Node
class_name BaseState

func on_enter(_player: Player):
	pass;

func update(_player: Player, _input: PlayerInput):
	pass;

func get_next_state(_player: Player, _input: PlayerInput):
	return null;
