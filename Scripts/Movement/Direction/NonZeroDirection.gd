class_name NonZeroDirection
extends Direction


@export var direction: Direction


@export var default: Vector2 = Vector2.UP:
	set(value):
		default = Vector2.UP if value.is_zero_approx() else value


func get_direction(body: CharacterBody2D) -> Vector2:
	var dir: Vector2 = direction.get_direction(body)
	return default if dir.is_zero_approx() else dir
