class_name VectorUtils
extends Object


static func in_basis_of(x_axis: Vector2, to_change: Vector2) -> Vector2:
	var orthogonal: Vector2 = x_axis.orthogonal()
	return Vector2(to_change.dot(x_axis), to_change.dot(orthogonal))


static func from_basis_of(x_axis: Vector2, to_change: Vector2) -> Vector2:
	var orthogonal: Vector2 = x_axis.orthogonal()
	return to_change.x * x_axis + to_change.y * orthogonal
