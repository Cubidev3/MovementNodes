class_name MacroMovement
extends Movement


var components: Array[Movement] = []


func start(body: CharacterBody2D):
	for component: Movement in components:
		component.start(body)


func run(body: CharacterBody2D, delta: float):
	for component: Movement in components:
		component.run(body, delta)


func _ready() -> void:
	child_entered_tree.connect(on_child_enter)
	child_exiting_tree.connect(on_child_exited)
	_get_child_components()


func _get_child_components() -> void:
	components.clear()
	
	for child: Node in get_children():
		if child is Movement:
			components.append(child)


func on_child_enter(child: Node) -> void:
	if child is Movement:
		components.append(child)


func on_child_exited(child: Node) -> void:
	if components.has(child):
		components.erase(child)
