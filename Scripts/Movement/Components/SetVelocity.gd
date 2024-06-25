class_name SetVelocity
extends Movement


@export var velocity: Direction


@export var run_continuously: bool = true


func start(body: CharacterBody2D):
	body.velocity = velocity.get_direction(body)
	
	
func run(body: CharacterBody2D, delta: float):
	if run_continuously:
		start(body)
