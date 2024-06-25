class_name SumDirection
extends Direction


@export var direction: Direction
@export var extra: Vector2


func get_direction(body: CharacterBody2D) -> Vector2:
	var dir = direction.get_direction(body)
	return dir + extra
