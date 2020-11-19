extends Node2D

func show_text(text: String) -> void:
	$Text.text = text;
	$Tween.reset_all();

	$Tween.interpolate_property($Text, "percent_visible", 0, 1, 1);
	$Tween.start();
