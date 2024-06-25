class_name MovementOnDirectionComparison
extends Movement


@export var component: Movement


@export_category("Operands")
@export var direction_a: Direction
@export var direction_b: Direction


@export_category("Apply Situations")
@export var apply_when_different: bool = true
@export var apply_when_equal: bool = false


func start(body: CharacterBody2D):
	if can_execute(body):
		component.start(body)


func run(body: CharacterBody2D, delta: float):
	if can_execute(body):
		component.run(body, delta)


func can_execute(body: CharacterBody2D) -> bool:
	var dir_a: Vector2 = direction_a.get_direction(body)
	var dir_b: Vector2 = direction_b.get_direction(body)
	
	var are_equal: bool = dir_a.is_equal_approx(dir_b)
	return (are_equal and apply_when_equal) or (not are_equal and apply_when_different)
