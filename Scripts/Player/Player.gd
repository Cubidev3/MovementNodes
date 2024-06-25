class_name Player
extends Node


@export var body: CharacterBody2D
@export var movement: Movement
@export var gravity: Movement
@export var jump: Movement


func _physics_process(delta: float) -> void:
	movement.run(body, delta)
	gravity.run(body, delta)
	
	if body.is_on_floor() and Input.is_action_just_pressed("jump"):
		jump.start(body)
	
	
	body.move_and_slide()
