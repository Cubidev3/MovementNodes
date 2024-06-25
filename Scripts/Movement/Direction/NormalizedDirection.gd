class_name NormalizedDirection
extends Direction


@export var direction: Direction


func get_direction(body: CharacterBody2D) -> Vector2:
	var dir: Vector2 = direction.get_direction(body)
	return dir.normalized()
