class_name Impulse
extends Movement


enum APPLY_MODE { Additive, Reset }


@export_category("Impulse")
@export var direction: Direction
@export var magnitude: float = 100
@export var mode: APPLY_MODE = APPLY_MODE.Additive


func start(body: CharacterBody2D):
	match mode:
		APPLY_MODE.Additive:
			body.velocity += direction.get_direction(body) * magnitude
			
		APPLY_MODE.Reset:
			var dir = direction.get_direction(body)
			if dir.is_zero_approx():
				return
			
			var velocity: Vector2 = VectorUtils.in_basis_of(dir, body.velocity)
			velocity.x = magnitude
			body.velocity = VectorUtils.from_basis_of(dir, velocity)
			
