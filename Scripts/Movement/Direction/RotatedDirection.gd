class_name RotatedDirection
extends Direction


@export var direction: Direction
@export var rotation: float = 0.0


func get_direction(body: CharacterBody2D) -> Vector2:
	var dir = direction.get_direction(body)
	return dir.rotated(rotation)
