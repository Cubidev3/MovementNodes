class_name SurfaceDependentMovement
extends Movement


@export var floor_movement: Movement
@export var wall_movement: Movement
@export var ceiling_movement: Movement
@export var air_movement: Movement


func start(body: CharacterBody2D):
	var movement: Movement = get_current_movement(body)
	if movement != null:
		movement.start(body)


func run(body: CharacterBody2D, delta: float):
	var movement: Movement = get_current_movement(body)
	if movement != null:
		movement.run(body, delta)


func get_current_movement(body: CharacterBody2D) -> Movement:
	if body.is_on_floor():
		return floor_movement
		
	if body.is_on_wall():
		return wall_movement
		
	if body.is_on_ceiling():
		return ceiling_movement
		
	return air_movement
