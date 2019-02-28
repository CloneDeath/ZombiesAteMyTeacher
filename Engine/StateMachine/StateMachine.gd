extends Node
class_name StateMachine

var current_state = null;

func _ready():
	current_state = get_children()[0];

func _physics_process(delta):
	update_current_state();
	var entity = get_parent();
	current_state.update(entity, delta);

func update_current_state():
	var entity = get_parent();
	var next = current_state.get_next_state(entity);
	if (next == null): return;
	transition_to_state(next);

func transition_to_state(state_name):
	var entity = get_parent();
	current_state.on_exit(entity);
	current_state = get_node(state_name);
	current_state.on_enter(entity);