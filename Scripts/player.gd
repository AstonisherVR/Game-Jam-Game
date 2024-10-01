extends CharacterBody2D

@export var speed: int = 50
@export var animations: AnimationPlayer
var direction: String = "Down"
func _ready() -> void:
	pass
	
func _physics_process(delta: float) -> void:
	#print(direction)
	handle_input()
	move_and_slide()
	update_animations()

func update_animations():
	if velocity.x < 0:
		direction = "Left"
		animations.play(direction + " Walk")
	elif velocity.x > 0:
		direction = "Right"
		animations.play(direction + " Walk")
	elif velocity.y < 0:
		direction = "Up"
		animations.play(direction + " Walk")
	elif velocity.y > 0:
		direction = "Down"
		animations.play(direction + " Walk")
	elif velocity == Vector2.ZERO:
		animations.play("Idle " + direction)

func handle_input():
	var move_direction = Input.get_vector("Left","Right","Up","Down")
	velocity = move_direction * speed
