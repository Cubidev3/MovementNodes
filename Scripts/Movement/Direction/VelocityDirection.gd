class_name VelocityDirection
extends Direction


@export var real: bool = false


func get_direction(body: CharacterBody2D) -> Vector2:
	return body.get_real_velocity() if real else body.velocity
