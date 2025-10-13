extends CharacterBody3D

@export var WALK_SPEED = 10
@export var JUMP_FORCE = 5
@export var MOUSE_SENSITIVITY = 0.05

func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	
func _physics_process(delta: float) -> void:
	
	var input_direction = Vector3.ZERO
	input_direction.x = Input.get_axis("Left","Right")
	input_direction.z = Input.get_axis("Forward","Backward")
	print("Input:",input_direction)
	input_direction = input_direction.rotated(Vector3.UP,rotation.y)
	print("Rotated Input:",input_direction)
	if Input.is_action_just_pressed("Jump") and is_on_floor():
		input_direction.y = JUMP_FORCE
	
	if Input.is_action_just_pressed("Mouse_Lock_Unlock"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE if Input.mouse_mode == Input.MOUSE_MODE_CAPTURED else Input.MOUSE_MODE_CAPTURED)
	
	if input_direction.y and is_on_floor():
		velocity.y = JUMP_FORCE
	else:
		velocity.y += get_gravity().y * delta
		
	velocity.x = move_toward(velocity.x,input_direction.x * WALK_SPEED,delta * WALK_SPEED)
	velocity.z = move_toward(velocity.z,input_direction.z * WALK_SPEED,delta * WALK_SPEED)
	move_and_slide()

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion and Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
		rotation.y -= event.relative.x * MOUSE_SENSITIVITY
