extends Node2D

func _input(event: InputEvent) -> void:
	if (event.is_pressed()):
		get_tree().change_scene("res://Levels/Levels/Classroom/Classroom.tscn");
