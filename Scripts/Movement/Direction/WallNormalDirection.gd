class_name WallNormalDirection
extends Direction


@export var default: Direction


func get_direction(body: CharacterBody2D) -> Vector2:
	return body.get_wall_normal() if body.is_on_wall() else default.get_direction(body)
