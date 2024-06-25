class_name RepeatMovement
extends Movement


@export var component: Movement
@export var count: int = 1


func start(body: CharacterBody2D):
	for i: int in count:
		component.start(body)


func run(body: CharacterBody2D, delta: float):
	for i: int in count:
		component.run(body, delta)
