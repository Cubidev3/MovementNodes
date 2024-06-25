class_name Acceleration
extends Movement


@export var direction: Direction
@export var magnitude: float = 100


func run(body: CharacterBody2D, delta: float):
	var axis: Vector2 = direction.get_direction(body)
	if axis.is_zero_approx():
		return
	
	var velocity = VectorUtils.in_basis_of(axis, body.velocity)
	velocity.x += magnitude * delta
	body.velocity = VectorUtils.from_basis_of(axis, velocity)
