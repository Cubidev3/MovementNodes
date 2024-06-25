class_name MovementOnMagnitudeComparison
extends Movement


@export var component: Movement


@export_category("Operands")
@export var direction: Direction
@export var magnitude: float = 1.0


@export_category("Apply Situations")
@export var apply_when_higher: bool = false
@export var apply_when_equal: bool = false
@export var apply_when_lower: bool = true


func start(body: CharacterBody2D):
	if can_execute(body):
		component.start(body)


func run(body: CharacterBody2D, delta: float):
	if can_execute(body):
		component.run(body, delta)


func can_execute(body: CharacterBody2D) -> bool:
	var dir_magnitude: float = direction.get_direction(body).length()
	return (dir_magnitude > magnitude and apply_when_higher) or (is_equal_approx(dir_magnitude, magnitude) and apply_when_equal) or (dir_magnitude < magnitude and apply_when_lower)
