class_name FloorNormalDirection
extends Direction


@export var default: Direction


func get_direction(body: CharacterBody2D) -> Vector2:
	return body.get_floor_normal() if body.is_on_floor() else default.get_direction(body)
