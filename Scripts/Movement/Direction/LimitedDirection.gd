class_name LimitedDirection
extends Direction


@export var direction: Direction
@export var max_length: float = 1.0


func get_direction(body: CharacterBody2D) -> Vector2:
	var dir: Vector2 = direction.get_direction(body)
	return dir.limit_length(max_length)
