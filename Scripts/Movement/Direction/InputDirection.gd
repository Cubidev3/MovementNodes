class_name InputDirection
extends Direction


@export var up_direction: Direction


@export var right_action: String = "right"
@export var left_action: String = "left"

@export var down_action: String = "down"
@export var up_action: String = "up"


func get_direction(body: CharacterBody2D) -> Vector2:
	var up: Vector2 = up_direction.get_direction(body)
	if up.is_zero_approx():
		return Vector2.ZERO
		
	var orthogonal: Vector2 = -up.orthogonal()
	var x = get_axis(left_action, right_action)
	var y = get_axis(up_action, down_action)
	
	return (x * orthogonal + y * up).limit_length(1)


func get_axis(negative: String, positive: String) -> float:
	return get_action_strength(positive) - get_action_strength(negative)
		
		
func get_action_strength(action: String) -> float:
	return Input.get_action_strength(action) if InputMap.has_action(action) else 0.0
