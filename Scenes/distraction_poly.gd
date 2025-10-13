extends Polygon2D

const SPEED = 100
var lifespan := 2.75
func _physics_process(delta: float) -> void:
	var trajectory = Vector2.RIGHT.rotated(rotation + PI / 4) * SPEED * delta
	if visible:
		position += trajectory
		lifespan -= delta
	if lifespan <= 0:
		queue_free()
