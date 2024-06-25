class_name VelocityLimit
extends Movement


@export var axis: Direction
@export var max_magnitude: float = 100


@export var limit_negative: bool = true
@export var run_continuously: bool = true


func start(body: CharacterBody2D):
	var axis: Vector2 = self.axis.get_direction(body)
	
	if axis.is_zero_approx():
		return
	
	var velocity: Vector2 = VectorUtils.in_basis_of(axis, body.velocity)
	velocity.x = clamp(velocity.x, -max_magnitude, max_magnitude)
	body.velocity = VectorUtils.from_basis_of(axis, velocity)


func run(body: CharacterBody2D, delta: float):
	if run_continuously:
		start(body)
		
		
func limited(value: float) -> float:
	if not limit_negative:
		return minf(value, max_magnitude)
		
	return clamp(value, -max_magnitude, max_magnitude)
