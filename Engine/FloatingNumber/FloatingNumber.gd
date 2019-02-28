extends Node2D
export(float) var value = 0;

func _ready():
	$ValueHolder/Value.text = str(value);