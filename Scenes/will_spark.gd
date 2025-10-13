extends Polygon2D

@export var posScalar = 195
const basePos = Vector2(960,540)
func _process(_delta: float) -> void:
	var inputAxes = Vector2(0,0)
	inputAxes.x = Input.get_axis("Left","Right")
	inputAxes.y = Input.get_axis("Forward","Backward")
	inputAxes = inputAxes.normalized()
	position.x = inputAxes.x * posScalar + basePos.x
	position.y = inputAxes.y * posScalar + basePos.y
