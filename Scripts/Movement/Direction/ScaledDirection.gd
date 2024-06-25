class_name ScaledDirection
extends Direction


@export var direction: Direction
@export var scale: Direction


func get_direction(body: CharacterBody2D) -> Vector2:
	var dir: Vector2 = direction.get_direction(body)
	var scl: Vector2 = scale.get_direction(body)
	return Vector2(scl.x * dir.x, scl.y * dir.y)
