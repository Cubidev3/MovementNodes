class_name Deceleration
extends Movement


@export var axis: Direction
@export var magnitude: float = 100


func run(body: CharacterBody2D, delta: float):
	var axis: Vector2 = self.axis.get_direction(body)
	
	if axis.is_zero_approx():
		return

	var velocity: Vector2 = VectorUtils.in_basis_of(axis, body.velocity)
	velocity.x = move_toward(velocity.x, 0.0, magnitude * delta)
	body.velocity = VectorUtils.from_basis_of(axis, velocity)
