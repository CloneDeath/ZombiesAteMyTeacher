extends Area2D

var damaged_entities = [];

func _process(_delta):
	for enemy in get_overlapping_bodies():
		if (enemy in damaged_entities): continue;
		if (enemy.has_method("damage")):
			enemy.damage(1);
			damaged_entities.append(enemy);

func reset_damage():
	damaged_entities = [];