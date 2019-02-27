extends Node

onready var current_state:BaseState = $Idle;

func _process(_delta):
	update_current_state();
	var player = get_parent();
	current_state.update(player, player.input);

func update_current_state():
	var player = get_parent();
	var next = current_state.get_next_state(player, player.input);
	if (next == null): return;
	current_state = get_node(next);
	current_state.on_enter(player);