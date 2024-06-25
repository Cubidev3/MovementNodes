class_name ChainDirection
extends Direction


@export var direction_chain: Array[Direction] = []


@export var default: Vector2 = Vector2.ZERO


func get_direction(body: CharacterBody2D) -> Vector2:
	for direction in direction_chain:
		var dir: Vector2 = direction.get_direction(body)
		
		if not dir.is_zero_approx():
			return dir
	
	return default
