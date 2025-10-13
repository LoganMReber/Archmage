extends Node2D

@onready var enemy_template = $DistractionPoly

const SPAWN_WINDOW = 1.0
const SPAWN_DISTANCE = 500
var timer := 0.0

func spawnEnemy() -> void:
	var spawnAngle = randi() % 8 * PI / 4
	var spawnOffset = Vector2(SPAWN_DISTANCE,0).rotated(spawnAngle)
	var new_enemy = enemy_template.duplicate()
	new_enemy.visible = true
	new_enemy.position = Vector2(960,540) + spawnOffset
	new_enemy.rotation = spawnAngle + PI * 0.75
	add_child(new_enemy)


func _physics_process(delta: float) -> void:
	timer += delta
	if timer >= SPAWN_WINDOW:
		spawnEnemy()
		timer = 0
	
