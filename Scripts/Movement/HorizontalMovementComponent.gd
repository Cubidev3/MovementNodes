class_name HorizontalMovementComponent
extends Node


@export_category("Body")
@export var body: CharacterBody2D


@export_category("Speeds")
@export var max_speed: float = 480
@export var initial_speed: float = 80


@export_category("Timings")
@export var time_to_max_speed: float = 0.2
@export var time_to_zero_speed: float = 0.12
@export var time_to_turn_around: float = 0.08


var acceleration: float
var deceleration: float
var turn_around_acceleration: float


func _ready() -> void:
	_calculate_variables()


func _calculate_variables():
	acceleration = max_speed / time_to_max_speed
	deceleration = max_speed / time_to_zero_speed
	turn_around_acceleration = max_speed / time_to_turn_around


func move(direction: float, is_inert: bool, delta: float):
	if is_zero_approx(direction):
		decelerate(delta)
		return
	
	if is_inert:
		start_movement(direction)
		return
	
	if is_turning_around(direction):
		accelerate(turn_around_acceleration, direction, delta)
		return
	
	accelerate(acceleration, direction, delta)


func start_movement(direction: float):
	body.velocity.x = initial_speed * direction


func accelerate(acceleration: float, direction: float, delta: float):
	body.velocity.x = move_toward(body.velocity.x, max_speed * direction, acceleration * delta)


func decelerate(delta: float):
	body.velocity.x = move_toward(body.velocity.x, 0.0, deceleration * delta)


func is_turning_around(direction: float) -> bool:
	return (direction < 0 and body.velocity.x > 0) or (direction > 0 and body.velocity.x < 0)
