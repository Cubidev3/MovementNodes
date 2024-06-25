class_name DotProductBasedMovement
extends Movement


@export var direction_a: Direction
@export var direction_b: Direction


@export var positive: Movement
@export var negative: Movement
@export var zero: Movement


func start(body: CharacterBody2D):
	var movement: Movement = get_current_movement(body)
	if movement != null:
		movement.start(body)


func run(body: CharacterBody2D, delta: float):
	var movement: Movement = get_current_movement(body)
	if movement != null:
		movement.run(body, delta)


func get_current_movement(body: CharacterBody2D) -> Movement:
	var dir_a: Vector2 = direction_a.get_direction(body)
	var dir_b: Vector2 = direction_b.get_direction(body)
	var dot: float = dir_a.dot(dir_b)
	
	if dot != 0:
		print("gay")
	
	if is_zero_approx(dot):
		return zero
		
	if dot < 0:
		return negative
		
	return positive


func is_turning_around(body: CharacterBody2D, dir: float) -> bool:
	return (body.velocity.x < 0 and dir > 0) or (body.velocity.x > 0 and dir < 0)
