class_name VerticalMovementComponent
extends Node


@export_category("Body")
@export var body: CharacterBody2D


@export_category("Heights")
@export var max_jump_height: float = 480
@export var min_jump_height: float = 320


@export_category("Timings")
@export var time_to_max_height: float = 0.45
@export var time_to_fall_from_height: float = 0.35


var jump_force: float
var gravity: float
var low_jump_gravity: float
var fall_gravity: float


func _ready() -> void:
	calculate_variables()


func jump() -> void:
	body.velocity.y = -jump_force
	
	
func apply_gravity(is_low_jumping: bool, delta: float) -> void:
	var gravity: float = self.gravity
	if body.velocity.y < 0:
		gravity = fall_gravity
	
	elif is_low_jumping:
		gravity = low_jump_gravity
	
	body.velocity.y += gravity * delta


func calculate_variables() -> void:
	jump_force = 2 * max_jump_height / time_to_max_height
	gravity = 2 * max_jump_height / time_to_max_height / time_to_max_height
	low_jump_gravity = jump_force * jump_force / 2 / min_jump_height
	fall_gravity = 2 * max_jump_height / time_to_fall_from_height / time_to_fall_from_height
